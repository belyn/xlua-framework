using XLua;
using Unity.Entities;
using UnityEngine;
using Unity.Collections;
using System.Collections.Generic;
using System;

namespace ECS
{
    [LuaCallCSharp]
    public static class WorldExt
    {
        public static Entity ConvertGameObjectToEntity(this World world, GameObject gameObject)
        {
            var settings = new GameObjectConversionSettings(
                world,
                GameObjectConversionUtility.ConversionFlags.AssignName);
            settings.FilterFlags = WorldSystemFilterFlags.HybridGameObjectConversion;
            return GameObjectConversionUtility.ConvertGameObjectHierarchy(gameObject, settings);
        }

    }

#if UNITY_EDITOR
    public static class WorldExtExporter
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp = new List<Type>()
        {
            typeof(WorldExtExporter),
        };
    }
#endif
}
