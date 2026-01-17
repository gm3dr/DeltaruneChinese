using System;
using System.Collections.Generic;
using System.Diagnostics;
using UndertaleModLib;

namespace deltarunePacker{
    // log分级:
    // Verbose: 运行状态 绝大部分情况无需关注
    // Info: 运行进度 尽量克制 不会刷太多
    // Warning: 资源(可能)存在问题 需检查/处理
    // Error: 代码执行逻辑(可能)存在问题 需检查/处理
    // Assert: 遇到了会导致无法继续执行的严重错误
    public enum LogLevel { All, Info, Warning, Error, Assert, Off }
    public class Loader(string resultPath, string datawinPath, LogLevel logLevel = LogLevel.Info): IDisposable {
        private readonly StreamWriter m_logger = new(new FileStream(Path.Combine(resultPath, "log.txt"), FileMode.Create, FileAccess.Write));

        protected string ResultPath { get => resultPath; }
        protected string DatawinPath { get => datawinPath; }
        public void Dispose() {
            m_logger.Dispose();
            GC.SuppressFinalize(this);
        }
        protected void Verbose(string msg) { if (logLevel <= LogLevel.All) Console.WriteLine("[V]" + msg); }
        protected void Info(string msg) { if (logLevel <= LogLevel.Info) Console.WriteLine("[I]" + msg); }
        protected void Warning(string msg) {
            if (logLevel <= LogLevel.Warning) {
                string full = "[W]" + msg;
                m_logger.WriteLine(full);
                Console.WriteLine(full);
            }
        }
        protected void Error(string msg) {
            if (logLevel <= LogLevel.Error) {
                string full = $"[E]{msg}\n{new StackTrace()}";
                m_logger.Write(full);
                Console.Error.Write(full);
            }
        }
        protected void Assert(string msg) {
            if (logLevel <= LogLevel.Assert) {
                string full = $"[A]{msg}\n{new StackTrace()}";
                m_logger.Write(full);
                Console.Error.Write(full);
            }
            throw new Exception(msg);
        }
        protected UndertaleData LoadData() {
            UndertaleData result = UndertaleIO.Read(
                new FileStream(datawinPath, FileMode.Open, FileAccess.Read),
                (warning, isImportant) => Warning($"[LoadData]warning: {warning}"),
                Verbose
            );
            Info($"{datawinPath} loaded!");
            return result;
        }
    }
}
