# CrashPrevention
在一些简单级别的bug发生时阻止程序因此而闪退

日常中由于项目代码不规范，导致程序运行期间出现数组越界，往数组放入nil对象，导致程序闪退，像这种问题，有时希望在正式包时忽略它不让App闪退。
本项目通过Rutime  swizzle 一些方法，来使得因这些错误而导致的闪退避免发生，

