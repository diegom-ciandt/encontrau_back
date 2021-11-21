import json

def hello_world_handler(event, context):

    return {
        'statusCode': 200,
        "headers": {
            'Content-Type': 'application/json'
        },
        'body': json.dumps({
            'body_text': 'Encontrau says HELLO WORLD from github actions!'
        })
    }
