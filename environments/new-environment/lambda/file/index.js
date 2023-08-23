const AWS = require('aws-sdk');
const svc = new AWS.Service({
    // change IP for correct ec2 IP
    endpoint: 'http://172.36.64.102/api',
    convertResponseTypes: false,
        // and now, our API endpoints
    apiConfig: {
        metadata: {
            protocol: 'rest-json' // we assume our API is JSON-based
        },
        operations: {
            // example how to send JSON data in the request body
            notifyBatchJobStatusChanged: {
                http: {
                    method: 'POST',
                    requestUri: '/notify'
                },
                input: {
                    type: 'structure',
                    required: [ 'auth', 'data' ],
                    // use "data" input for the request payload
                    payload: 'data',
                    members: {
                        'auth': {
                            location: 'header',
                            locationName: 'Authorization',
                            sensitive: true
                        },
                        'data': {
                            type: 'structure',
                            required: [ 'jobName', 'jobId' , 'jobQueue', 'status'],
                            // the shape of the body object
                            members: {
                                'jobName': {},
                                'jobId': {},
                                'jobQueue': {},
                                'status' : {}
                            }
                        }
                    }
                }
            }
        }
    }
});

// disable AWS region related login in the SDK
svc.isGlobalEndpoint = true;

exports.handler = function(event, context, callback) {
    if(!event.detail) {
        console.error('no event details');
        let res = {
            statusCode: 404,
            body: JSON.stringify('no event details'),
        };
        return res;
    }
    let jobName = event.detail.jobName;
    let jobId = event.detail.jobId;
    let jobQueue = event.detail.jobQueue;
    let status = event.detail.status;

    if(jobQueue.includes('dev')){
        svc.endpoint = 'http://172.36.64.103/api'
    }
    if(jobQueue.includes('test')){
        svc.endpoint = 'http://172.36.64.106/api'    
    }    
    if(jobQueue.includes('sb')){
        svc.endpoint = 'http://172.36.64.108/api'
    }
    if(jobQueue.includes('training')){
        svc.endpoint = 'http://172.36.64.107/api'    
    } 
    
    svc.notifyBatchJobStatusChanged({
        auth: `Bearer QL35NqSaTEZ2wZHHZVwZ5uw8MhMutbnPTzM9eRWQ`,
        data: {
            jobName: jobName,
            jobId: jobId,
            jobQueue: jobQueue,
            status: status
        }
    }, (err, data) => {

        if (err) {
            console.error('>>> operation error:', err);
            return callback(err);
        }

        console.log('notify completed');
        callback();
    });

};