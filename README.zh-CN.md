# DSH-FreeLLMAPI-Lab

[English](README.en.md) · [Русский](README.md) · **简体中文**

这是一个独立的社区研究项目，关注 **DeepSeek Harness（DSH）**、**dsh-camel** 与 **FreeLLMAPI** 在真实编程代理任务中的可靠性。

> **状态：实验性（EXPERIMENTAL），尚未发布 v0.1.0。** 示例配置不保证服务可用性、配额或正式支持。本项目并非上述软件维护者的官方指南。

## 项目目标

一次 API 请求成功，并不意味着编程代理可以完成整个任务。速率限制、重复重试、请求大小限制、Windows 沙箱和工具调用失败都可能使任务中断。我们希望通过可复现的测试、明确的验收标准和匿名统计，找出哪些配置真正有效。

## 项目内容

- [项目路线图与进度记录（俄文）](ROADMAP.md)
- [测试方法（俄文）](docs/methodology.md)
- [33 个 DSH 会话的匿名统计](research/2026-10-16-baseline.md)
- [DSH 网关配置示例（实验性）](examples/dsh/gateway-minimal.example.yml)
- [dsh-camel 配置示例（实验性）](examples/camel/desktop-profile.patch.example.yml)
- [贡献指南（俄文）](CONTRIBUTING.md)与[安全须知（俄文）](SECURITY.md)

## 欢迎参与

欢迎提交经过验证的配置、可复现的问题报告、模型兼容性测试、文档改进，以及其他语言的翻译。特别欢迎中文母语者检查本文与后续中文文档中的技术术语和表达。

**请勿提交未经脱敏的 DSH 会话记录、API 密钥、私人提示词、商业项目源码或个人身份信息。** 请只分享匿名汇总结果或合成测试数据。

项目使用 MIT 许可证。**本中文版本为机器辅助的初稿，尚待母语者审核。**