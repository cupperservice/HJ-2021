# 課題6
以下の課題を実施する
[README](../README.md)に記載されているリソースをTerraformを使用して作成する。

## 提出物
* 今まで作成したterraformの定義
* 理解できていない点

## 作成対象
* VPC (作成済み)
* サブネット (作成済み)
* ルートテーブル (作成済み)
* セキュリティグループ (一部作成済み)
* DynamoDB
* RDS
* Bastion Server (作成済み)
* Auto Scaling Group
* Target Group
* Load Balancer
* IAMロール
* ECS

## ECSについて
* 構成  
![](./img/ecs.png)
  * 注1) __本来はIAM Roleもterraformで作成する必要があるが、権限がなく作成できないため手動で作成する。__

* task definition(json)の内容
```
[
  {
    "essential": true,
    "entryPoint": [
      "java", "-jar", "/app.jar"
    ],
    "image": "public.ecr.aws/z8b9j0x2/rest-sample:latest",
    "name": "app-svr",
    "ulimits": [
      {
        "name": "nofile",
        "softLimit": 65536,
        "hardLimit": 65536
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/app-svr/task-definition",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "app-svr"
      }
    },
    "portMappings": [
      {
        "containerPort": 8080,
        "hostPort": 8080,
        "protocol": "tcp"
      }
    ],
    "environment": [
      {
        "name": "spring.datasource.driver-class-name",
        "value": "com.mysql.cj.jdbc.Driver"
      },
      {
        "name": "spring.datasource.url",
        "value": "jdbc:mysql://${db_endpoint}/${db_name}"
      },
      {
        "name": "spring.datasource.username",
        "value": "${db_username}"
      },
      {
        "name": "spring.datasource.password",
        "value": "${db_password}"
      },
      {
        "name": "session.table_name",
        "value": "${session_table_name}"
      }
    ],
    "secrets": [
    ]
  }
]
```

## 参照資料
[Terraform AWS Providor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
