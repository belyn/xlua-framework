using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unity.Entities;
using XLua;

namespace ECS.EntityTags
{
    public struct PreDefineTag1 : ISharedComponentData 
    {
    }
    public struct PreDefineTag2 : ISharedComponentData
    {
    }
    public struct PreDefineTag3 : ISharedComponentData
    {
    }
    public struct PreDefineTag4 : ISharedComponentData
    {
    }
    public struct PreDefineTag5 : ISharedComponentData
    {
    }
    public struct PreDefineTag6 : ISharedComponentData
    {
    }
    public struct PreDefineTag7 : ISharedComponentData
    {
    }
    public struct PreDefineTag8 : ISharedComponentData
    {
    }
    public struct PreDefineTag9 : ISharedComponentData
    {
    }
    public struct PreDefineTag10 : ISharedComponentData
    {
    }
    public struct PreDefineTag11 : ISharedComponentData
    {
    }
    public struct PreDefineTag12 : ISharedComponentData
    {
    }
    public struct PreDefineTag13 : ISharedComponentData
    {
    }
    public struct PreDefineTag14 : ISharedComponentData
    {
    }
    public struct PreDefineTag15 : ISharedComponentData
    {
    }
    public struct PreDefineTag16 : ISharedComponentData
    {
    }
    public struct PreDefineTag17 : ISharedComponentData
    {
    }
    public struct PreDefineTag18 : ISharedComponentData
    {
    }
    public struct PreDefineTag19 : ISharedComponentData
    {
    }
    public struct PreDefineTag20 : ISharedComponentData
    {
    }


    //单元测试用
    public struct PreDefineTag1001 : ISharedComponentData
    { }
    public struct PreDefineTag1002 : ISharedComponentData
    { }

#if UNITY_EDITOR
    public static class PreDefineTagExporter
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp = new List<Type>()
        {
            typeof(PreDefineTag1),
            typeof(PreDefineTag2),
            typeof(PreDefineTag3),
            typeof(PreDefineTag4),
            typeof(PreDefineTag5),
            typeof(PreDefineTag6),
            typeof(PreDefineTag7),
            typeof(PreDefineTag8),
            typeof(PreDefineTag9),
            typeof(PreDefineTag10),
            typeof(PreDefineTag11),
            typeof(PreDefineTag12),
            typeof(PreDefineTag13),
            typeof(PreDefineTag14),
            typeof(PreDefineTag15),
            typeof(PreDefineTag16),
            typeof(PreDefineTag17),
            typeof(PreDefineTag18),
            typeof(PreDefineTag19),
            typeof(PreDefineTag20),

            typeof(PreDefineTag1001),
            typeof(PreDefineTag1002),
        };
    }
#endif
}
