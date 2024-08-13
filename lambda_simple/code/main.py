def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': 'Hello, this is a response from the Lambda function!'
    }