---
title: "Helm部署metallb和分配地址"
date: 2023-07-14T16:00:56+08:00
draft: false
author: 'Gic'
description: 'hugo的部署文档见解，可能也有错的，请见谅'
tag: ['技术']
---
## 前提

    1. 安装Helm：首先，确保你已经安装了Helm。你可以按照Helm的官方文档进行安装。
    2. 安装k8s： k8s部署后以及kubectl命令能正常使用的情况下在执行以下步骤
    3. kubecm的切换也要使用
    
## helm添加metallb的helm仓库

```yaml
helm repo add metallb https://metallb.github.io/metallb
helm repo update
```

## 安装

安装MetalLB：执行以下命令来安装MetalLB：
```yaml
helm install metallb metallb/metallb
## 我在这边碰到的故障（因为我之前安装删除过，但是没删除干净导致）
## 故障现象：
Error: INSTALLATION FAILED: rendered manifests contain a resource that already exists. Unable to continue with install: ValidatingWebhookConfiguration "metallb-webhook-configuration" in namespace "" exists and cannot be imported int
o the current release: invalid ownership metadata; label validation error: missing key "app.kubernetes.io/managed-by": must be set to "Helm"; annotation validation error: missing key "meta.helm.sh/release-name": must be set to "meta
llb"; annotation validation error: missing key "meta.helm.sh/release-namespace": must be set to "default"

解决方法：
1. 确认资源状态：使用以下命令确认是否存在名为"metallb-webhook-configuration"的ValidatingWebhookConfiguration资源
  kubectl get validatingwebhookconfiguration metallb-webhook-configuration  
2. 删除已经存在的ValidatingWebhookConfiguration资源：
  kubectl delete validatingwebhookconfiguration metallb-webhook-configuration
3. 然后在执行helm install metallb metallb/metallb
```

## 设置configMap

创建并配置ConfigMap：创建一个名为metallb-config的ConfigMap，并在其中配置你的IP地址池。示例如下：
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: default
  name: metallb-config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 192.168.7.204-192.168.7.206 # 地址池自己根据node网段设定
```
将上述配置保存到一个文件（例如metallb-config.yaml），然后执行以下命令将ConfigMap应用到集群中：
```yaml
kubectl apply -f metallb-config.yaml
```
在上述示例中，我们配置了一个名为default的地址池，协议使用的是layer2，并指定了IP地址范围。

## 查看验证

等待部署完成：MetalLB将会以DaemonSet的方式在集群中部署。你可以使用以下命令检查Pod的运行状态：
```yaml
kubectl get pods -n default -l app.kubernetes.io/name=metallb
```
等待所有的MetalLB Pod都变为运行状态。
![metallb](/images/k8s/metallb_pod.png) 

完成上述步骤后，MetalLB将被成功部署，并为你的Kubernetes集群提供IP地址负载均衡的功能，使用你配置的地址池供服务使用。  
请注意，上述配置示例中的IP地址范围仅作为参考，请根据你的网络设置和需求进行适当的配置。    
如果你遇到问题或需要详细了解更多配置选项，请参考MetalLB的官方文档或查阅相关资源。