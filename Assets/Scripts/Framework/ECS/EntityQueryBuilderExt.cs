using ECS.Components;
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
    }
}
