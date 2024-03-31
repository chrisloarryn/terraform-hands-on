
### to create a new project based on the AWS Node.js template
```bash
serverless create --template aws-nodejs --path localstack-lambda
```

### to install the localstack plugin
```bash
npm install -g serverless-localstack
```

### to navigate to the project directory
```bash
cd localstack-lambda
```

### to deploy the project to localstack
```bash
serverless deploy --stage local
serverless info --stage local
```

### to invoke the lambda function
```bash
serverless invoke --function hello --stage local --log --data '{"name": "John"}'
```