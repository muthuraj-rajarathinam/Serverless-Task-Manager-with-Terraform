import json
import boto3
import os
import uuid

# Create DynamoDB resource
dynamodb = boto3.resource('dynamodb')

# Get the table name from environment variable
table_name = os.environ.get('TABLE_NAME')

# Reference the actual DynamoDB Table object (this is key!)
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    print("Received event:", json.dumps(event))  # Optional for debugging

    try:
        body = json.loads(event.get('body', '{}'))
        title = body.get('title', 'Untitled Task')
    except Exception as e:
        print("Error parsing request body:", str(e))
        return {
            'statusCode': 400,
            'body': json.dumps({'error': 'Invalid JSON'})
        }

    task_id = str(uuid.uuid4())

    item = {
        'task_id': task_id,
        'title': title,
        'status': 'pending'
    }

    try:
        table.put_item(Item=item)  
    except Exception as e:
        print("DynamoDB Error:", str(e))
        return {
            'statusCode': 500,
            'body': json.dumps({'error': 'Failed to save task'})
        }

    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Task created successfully',
            'task_id': task_id
        })
    }

