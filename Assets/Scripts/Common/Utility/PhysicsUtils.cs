using UnityEngine;
using XLua;
using System;
using System.Collections.Generic;

/// <summary>
/// added by marvin @ 2022.7.14
/// 功能：Physics扩展静态方法
/// </summary>

[Hotfix]
public class PhysicsUtils
{
    public static RaycastHit Raycast(Vector3 origin, Vector3 direction, float maxDistance = Mathf.Infinity, int layerMask = 0xffff, QueryTriggerInteraction queryTriggerInteraction = QueryTriggerInteraction.UseGlobal)
    {
        RaycastHit hit;
        Physics.Raycast(origin, direction, out hit, maxDistance, layerMask, queryTriggerInteraction);
        return hit;
    }

}

#if UNITY_EDITOR
public static class PhysicsUtilsExporter
{
    [LuaCallCSharp]
    public static List<Type> LuaCallCSharp = new List<Type>(){
            typeof(PhysicsUtils),
        };
}
#endif
