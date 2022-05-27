using System;
using XLua;
using Unity.Entities;
using UnityEngine;

namespace ECS.Components
{
    public struct ActorBaseInfo : IComponentData
    {
        public uint actorType;
        public ulong actorId;
        public int level;
    }
    public struct ActorMoveInfo : IComponentData
    {
        public int state;
        public int speed;
        public Vector3 targetPos;
    }
    public struct SyncActorPosInfo : IComponentData
    { 
        public Vector3 lastSyncPos;
    }
    public struct AvatarInfo : IComponentData
    {
        public uint camp;
        public uint career;
    }
    public struct ActorFightAttrInfo : IComponentData
    {
        public ulong curHp;
        public ulong maxHp;
    }
    

    //单元测试用
    public struct PreDefineComponent1001 : IComponentData
    {
        public long value1;
        public long value2;
        public long value3;
        public long value4;
    }
}
