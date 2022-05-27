using XLua;
using Unity.Entities;
using UnityEngine;
using Unity.Collections;

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
}
