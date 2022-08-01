# 阿里云服务目录示例 （Terraform）

服务目录（Service Catalog）基于阿里云基础设施即代码IaC（Infrastructure as Code）能力，帮助企业设定符合组织要求的产品并定义约束条件，构建可自助的服务列表，从而降低企业业务上云时选用产品的难度，提高IT服务交付效率。[查看服务目录的控制台](https://servicecatalog.console.aliyun.com/welcome)

## 示例

您可以通过当前库获取到服务目录的示例模版如下，使用方式可[查看参考文档](https://help.aliyun.com/document_detail/403733.html)

### 入门示例

|  类型   | 名称  | 说明  |
|  ----  | ----  |----  |
| ram  | [create_ram_role](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/demo/create_ram_role) | 创建一个RAM角色（免费） |
| ecs  | [create_ecs](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/demo/create_ecs) | 创建限制规格的ECS |

### 进阶示例

| 名称  | 云产品  | 描述  |
| ----  |----  |----  |
| [ack](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/ack) | 容器服务 ACK | 容器服务 Kubernetes 版（简称 ACK）提供高性能可伸缩的容器应用管理能力，支持企业级容器化应用的全生命周期管理 |
| [alb](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/alb) | 负载均衡 SLB | 负载均衡过对多台云服务器进行均衡的流量分发调度，消除单点故障提升应用系统的可靠性与吞吐力 |
| [cdn](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/cdn) | 内容分发网络 CDN | CDN内容分发网络解决跨地域跨运营商网络性能问题，提供稳定快速的加速服务 |
| [cr](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/cr) | 容器镜像 ACR | 容器镜像服务是面向容器镜像、Helm Chart 等符合 OCI 标准的云原生制品安全托管及高效分发平台 |
| [eci](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/eci) | 弹性容器实例 | 弹性容器实例是 Serverless 和容器化的弹性计算服务 |
| [ecs](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/ecs) | 云服务器 ECS  | 云服务器 ECS是一种安全可靠、弹性可伸缩的云计算服务，助您降低 IT 成本，提升运维效率  |
| [eip](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/eip) | 弹性公网IP | 弹性公网IP是独立的公网IP资源，可与阿里云专有网络VPC类型的云服务器ECS、NAT网关、ENI网卡、私网负载均衡SLB绑定 |
| [group](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/group) | 安全组 | 安全组是一种虚拟防火墙，用于控制安全组内ECS实例的入流量和出流量，从而提高ECS实例的安全性 |
| [rds](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/rds) | 云数据库 RDS | 云数据库RDS MySQL 版 |
| [redis](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/redis) | 云数据库 redis | 云数据库 Redis 版是一种全托管、兼容Redis协议的内存数据库服务 |
| [vpc](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/vpc) | 专有网络 VPC | 专有网络VPC是用户基于阿里云创建的自定义私有网络, 不同的专有网络之间二层逻辑隔离 |
| [vsw](https://github.com/aliyun/alibabacloud-service-catalog-demo/tree/master/enterprise/vsw) | 交换机 vSwitch | 交换机（vSwitch）是组成专有网络的基础网络设备，用来连接不同的云资源实例 |






## 服务目录功能特性


![image](https://user-images.githubusercontent.com/100276871/156296303-586bd303-2f64-4028-8a9a-e4650e2a4644.png)

- 管理员进行产品管理和产品组合管理
  - 管理员可以基于Terraform定义合规产品，并管理产品的多个版本。
  - 管理员可以创建产品组合并添加已有产品，同时为终端用户授予访问产品和启动产品的权限，以便终端用户管理产品。
  - 管理员可以管理名下所有的产品实例，当终端用户有工作变动时，可以直接管理相应产品实例，避免业务中断。

- 终端用户启动产品并管理实例
  - 终端用户可以查询产品列表，并按需启动产品。
  - 终端用户可以查询、更新、终止产品的实例，从而进行云资源的生命周期管理。


## 服务目录产品优势

**保障资源的使用安全合规**

基于Terraform，可对104款云服务的类型、规格、命名规范、云资源编排等的合规性进行定义。更多信息，请参见服务目录支持的云服务。

**加快资源交付**

终端用户自助获取合规云资源，提升云资源交付速度。

**简化生命周期管理**

通过编组实现一组云资源的统一查询、更新、终止等。

**集中管理**

对产品进行集中的合规设置，并将设置共享到多个企业云账号，实现高效管理。


## 服务目录应用场景

**管理员自定义合规的企业产品**

管理员可以通过服务目录，自定义一个符合企业安全合规要求的产品。例如：您可以创建一台云服务器ECS，限定创建时候只能够使用特定的规格参数，降低安全风险的同时避免成本失控。

**终端用户快速创建云基础设施**

服务目录的产品可以由单个服务器组成，也可以是一组由数据库、中间件、服务器构成的Web站点。建议管理员为终端用户授予尽可能少的产品的启动和访问权限，以便终端用户快速查找和启动产品，减少控制台上各个云资源之间的跳转。

**最小化企业员工授权**

管理员可以仅对终端用户（企业员工）授予服务目录特定产品相关的权限，避免终端用户权限过高带来管理风险。
