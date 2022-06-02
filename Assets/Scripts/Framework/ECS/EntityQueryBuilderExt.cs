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
        public static EntityQueryBuilder WithAllActorMoveInfo(this EntityQueryBuilder builder)
        {
            return builder.WithAll<ActorMoveInfo>();
        }
        public static EntityQueryBuilder WithAllActorLookInfo(this EntityQueryBuilder builder)
        {
            return builder.WithAll<ActorLookInfo>();
        }
        public static EntityQueryBuilder WithAllSyncActorPosInfo(this EntityQueryBuilder builder)
        {
            return builder.WithAll<SyncActorPosInfo>();
        }
        public static EntityQueryBuilder WithAllActorFighAttrInfo(this EntityQueryBuilder builder)
        {
            return builder.WithAll<ActorFightAttrInfo>();
        }
        public static EntityQueryBuilder WithAllAvatarInfo(this EntityQueryBuilder builder)
        {
            return builder.WithAll<AvatarInfo>();
        }
        
        public static EntityQueryBuilder WithNoneActorBaseInfo(this EntityQueryBuilder builder)
        {
            return builder.WithNone<ActorBaseInfo>();
        }
        public static EntityQueryBuilder WithNoneActorMoveInfo(this EntityQueryBuilder builder)
        {
            return builder.WithNone<ActorMoveInfo>();
        }
        public static EntityQueryBuilder WithNoneActorLookInfo(this EntityQueryBuilder builder)
        {
            return builder.WithNone<ActorLookInfo>();
        }
        public static EntityQueryBuilder WithNoneSyncActorPosInfo(this EntityQueryBuilder builder)
        {
            return builder.WithNone<SyncActorPosInfo>();
        }
        public static EntityQueryBuilder WithNoneActorFighAttrInfo(this EntityQueryBuilder builder)
        {
            return builder.WithNone<ActorFightAttrInfo>();
        }
        public static EntityQueryBuilder WithNoneAvatarInfo(this EntityQueryBuilder builder)
        {
            return builder.WithNone<AvatarInfo>();
        }
    }

#if UNITY_EDITOR
    public static class EntiyQueryBuilderExporter
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp = new List<Type>()
        {
            typeof(EntityQueryBuilderExt),
        };
    }
#endif
}
