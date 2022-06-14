using System;
using XLua;
using Unity.Entities;
using UnityEngine;
using System.Collections.Generic;

namespace ECS.Components
{
    public struct ActorBaseInfo : IComponentData
    {
        public uint actorType;
        public ulong actorId;
    }
    
    //单元测试用
    public struct PreDefineComponent1001 : IComponentData
    {
        public long value1;
        public long value2;
        public long value3;
        public long value4;
    }

#if UNITY_EDITOR
    public static class PreDefineComponentExporter
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp = new List<Type>()
        {
            typeof(ActorBaseInfo),

            typeof(PreDefineComponent1001),
        };
    }
#endif
}
