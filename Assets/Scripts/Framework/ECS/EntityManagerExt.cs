using Unity.Entities;
using UnityEngine;
using XLua;
using ECS.Components;
using System.Collections.Generic;
using System;

namespace ECS
{
    [LuaCallCSharp]
    public static class EntityManagerExt
    {
        public static Animation GetAnimation(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentObject<Animation>(entity);
        }
        public static CharacterController GetCharacterController(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentObject<CharacterController>(entity);
        }
        public static Transform GetTransform(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentObject<Transform>(entity);
        }
        public static Rigidbody GetRigidbody(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentObject<Rigidbody>(entity);
        }
        public static Entity AddGameObjectEntity(this EntityManager entityMgr, GameObject gameObject)
        {
            return GameObjectEntity.AddToEntityManager(entityMgr, gameObject);
        }

        public static ActorBaseInfo GetActorBaseInfo(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentData<ActorBaseInfo>(entity);
        }
        public static bool AddActorBaseInfo(this EntityManager entityMgr, Entity entity, ActorBaseInfo data)
        {
            return entityMgr.AddComponentData(entity, data);
        }

        public static PreDefineComponent1001 GetPreDefineComponent1001(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentData<PreDefineComponent1001>(entity);
        }
        public static bool AddPreDefineComponent1001(this EntityManager entityMgr, Entity entity, PreDefineComponent1001 data)
        {
            return entityMgr.AddComponentData(entity, data);
        }
    }

#if UNITY_EDITOR
    public static class EntityManagerExtExporter 
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp = new List<Type>()
        {
            typeof(EntityManagerExt),
            typeof(EntityManager),
        };
    }
#endif
}
