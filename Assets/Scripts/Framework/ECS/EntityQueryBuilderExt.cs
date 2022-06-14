using ECS.Components;
using System;
using System.Collections.Generic;
using Unity.Entities;
using UnityEngine;
using XLua;

namespace ECS
{
    [LuaCallCSharp]
    public static class EntityQueryBuilderExt
    {
        public static EntityQueryBuilder WithAllActorBaseInfo(this EntityQueryBuilder builder)
        {
            return builder.WithAll<ActorBaseInfo>();
        }
    }

#if UNITY_EDITOR
    public static class EntiyQueryBuilderExporter
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp = new List<Type>()
        {
            typeof(EntityQueryBuilderExt),
            typeof(EntityQueryBuilder),
        };
    }
#endif
}
