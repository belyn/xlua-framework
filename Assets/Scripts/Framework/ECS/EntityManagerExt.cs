using Unity.Entities;
using UnityEngine;
using XLua;
using ECS.Components;
using ECS.EntityTags;
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

        public static ActorMoveInfo GetActorMoveInfo(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentData<ActorMoveInfo>(entity);
        }
        public static bool AddActorMoveInfo(this EntityManager entityMgr, Entity entity, ActorMoveInfo data)
        {
            return entityMgr.AddComponentData(entity, data);
        }
        
        public static ActorLookInfo GetActorLookInfo(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentData<ActorLookInfo>(entity);
        }
        public static bool AddActorLookInfo(this EntityManager entityMgr, Entity entity, ActorLookInfo data)
        {
            return entityMgr.AddComponentData(entity, data);
        }

        public static SyncActorPosInfo GetSyncActorPosInfo(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentData<SyncActorPosInfo>(entity);
        }
        public static bool AddSyncActorPosInfo(this EntityManager entityMgr, Entity entity, SyncActorPosInfo data)
        {
            return entityMgr.AddComponentData(entity, data);
        }

        public static ActorFightAttrInfo GetActorFightAttrInfo(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentData<ActorFightAttrInfo>(entity);
        }
        public static bool AddActorFightAttrInfo(this EntityManager entityMgr, Entity entity, ActorFightAttrInfo data)
        {
            return entityMgr.AddComponentData(entity, data);
        }

        public static AvatarInfo GetAvatarInfo(this EntityManager entityMgr, Entity entity)
        {
            return entityMgr.GetComponentData<AvatarInfo>(entity);
        }
        public static bool AddAvatarInfo(this EntityManager entityMgr, Entity entity, AvatarInfo data)
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


        public static bool AddPreDefineTag1(this EntityManager entityMgr, Entity entity, PreDefineTag1 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag2(this EntityManager entityMgr, Entity entity, PreDefineTag2 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag3(this EntityManager entityMgr, Entity entity, PreDefineTag3 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag4(this EntityManager entityMgr, Entity entity, PreDefineTag4 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag5(this EntityManager entityMgr, Entity entity, PreDefineTag5 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag6(this EntityManager entityMgr, Entity entity, PreDefineTag6 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag7(this EntityManager entityMgr, Entity entity, PreDefineTag7 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag8(this EntityManager entityMgr, Entity entity, PreDefineTag8 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag9(this EntityManager entityMgr, Entity entity, PreDefineTag9 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag10(this EntityManager entityMgr, Entity entity, PreDefineTag10 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag11(this EntityManager entityMgr, Entity entity, PreDefineTag11 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag12(this EntityManager entityMgr, Entity entity, PreDefineTag12 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag13(this EntityManager entityMgr, Entity entity, PreDefineTag13 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag14(this EntityManager entityMgr, Entity entity, PreDefineTag14 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag15(this EntityManager entityMgr, Entity entity, PreDefineTag15 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag16(this EntityManager entityMgr, Entity entity, PreDefineTag16 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag17(this EntityManager entityMgr, Entity entity, PreDefineTag17 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag18(this EntityManager entityMgr, Entity entity, PreDefineTag18 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag19(this EntityManager entityMgr, Entity entity, PreDefineTag19 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag20(this EntityManager entityMgr, Entity entity, PreDefineTag20 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag1001(this EntityManager entityMgr, Entity entity, PreDefineTag1001 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
        }
        public static bool AddPreDefineTag1002(this EntityManager entityMgr, Entity entity, PreDefineTag1002 data)
        {
            return entityMgr.AddSharedComponentData(entity, data);
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
