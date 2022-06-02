using System;
using System.Collections.Generic;
using Unity.Assertions;
using Unity.Collections;
using Unity.Entities;
using UnityEngine;
using XLua;

[assembly: DisableAutoCreation]
[assembly: LuaCallCSharp]
namespace ECS.Systems
{
    public class BasePreDefSystem : ComponentSystem
    {
        public Action OnCreateCall= null;
        public Action OnDestroyCall = null;
        public Action OnStartRunningCall = null;
        public Action OnStopRunningCall = null;
        public Action OnUpdateCall = null;
        
        public EntityQueryBuilder GetQueryBuilder()
        {
            return Entities;
        }

        protected override void OnCreate()
        {
            base.OnCreate();
            Assert.AreNotEqual(typeof(BasePreDefSystem), this.GetType());
            ComponentSystemGroup group = this.World.GetExistingSystem<SimulationSystemGroup>();
            Assert.IsNotNull(group);
            group.AddSystemToUpdateList(this);
            if(OnCreateCall != null)
            {
                OnCreateCall();
            }
        }

        protected override void OnDestroy()
        {
            base.OnDestroy();
            if(OnDestroyCall != null)
            {
                OnDestroyCall();
            }
        }

        protected override void OnStartRunning()
        {
            base.OnStartRunning();
            if(OnStartRunningCall != null)
            {
                OnStartRunningCall();
            }
        }

        protected override void OnStopRunning()
        {
            base.OnStopRunning();
            if (OnStopRunningCall != null)
            {
                OnStopRunningCall();
            }
        }

        protected override void OnUpdate()
        {
            if (OnUpdateCall != null)
            {
                OnUpdateCall();
            }
        }
    }

    public class PreDefineSys101 : BasePreDefSystem
    { }
    public class PreDefineSys102 : BasePreDefSystem
    { }
    public class PreDefineSys103 : BasePreDefSystem
    { }
    public class PreDefineSys104 : BasePreDefSystem
    { }
    public class PreDefineSys105 : BasePreDefSystem
    { }
    public class PreDefineSys106 : BasePreDefSystem
    { }
    public class PreDefineSys107 : BasePreDefSystem
    { }
    public class PreDefineSys108 : BasePreDefSystem
    { }
    public class PreDefineSys109 : BasePreDefSystem
    { }
    public class PreDefineSys110 : BasePreDefSystem
    { }
    public class PreDefineSys111 : BasePreDefSystem
    { }
    public class PreDefineSys112 : BasePreDefSystem
    { }
    public class PreDefineSys113 : BasePreDefSystem
    { }
    public class PreDefineSys114 : BasePreDefSystem
    { }
    public class PreDefineSys115 : BasePreDefSystem
    { }
    public class PreDefineSys116 : BasePreDefSystem
    { }
    public class PreDefineSys117 : BasePreDefSystem
    { }
    public class PreDefineSys118 : BasePreDefSystem
    { }
    public class PreDefineSys119 : BasePreDefSystem
    { }
    public class PreDefineSys120 : BasePreDefSystem
    { }
    public class PreDefineSys121 : BasePreDefSystem
    { }
    public class PreDefineSys122 : BasePreDefSystem
    { }
    public class PreDefineSys123 : BasePreDefSystem
    { }
    public class PreDefineSys124 : BasePreDefSystem
    { }
    public class PreDefineSys125 : BasePreDefSystem
    { }
    public class PreDefineSys126 : BasePreDefSystem
    { }
    public class PreDefineSys127 : BasePreDefSystem
    { }
    public class PreDefineSys128 : BasePreDefSystem
    { }
    public class PreDefineSys129 : BasePreDefSystem
    { }
    public class PreDefineSys130 : BasePreDefSystem
    { }


    public class PreDefineSys201 : BasePreDefSystem
    { }
    public class PreDefineSys202 : BasePreDefSystem
    { }
    public class PreDefineSys203 : BasePreDefSystem
    { }
    public class PreDefineSys204 : BasePreDefSystem
    { }
    public class PreDefineSys205 : BasePreDefSystem
    { }
    public class PreDefineSys206 : BasePreDefSystem
    { }
    public class PreDefineSys207 : BasePreDefSystem
    { }
    public class PreDefineSys208 : BasePreDefSystem
    { }
    public class PreDefineSys209 : BasePreDefSystem
    { }
    public class PreDefineSys210 : BasePreDefSystem
    { }

    public class PreDefineSys301 : BasePreDefSystem
    { }
    public class PreDefineSys302 : BasePreDefSystem
    { }
    public class PreDefineSys303 : BasePreDefSystem
    { }
    public class PreDefineSys304 : BasePreDefSystem
    { }
    public class PreDefineSys305 : BasePreDefSystem
    { }
    public class PreDefineSys306 : BasePreDefSystem
    { }
    public class PreDefineSys307 : BasePreDefSystem
    { }
    public class PreDefineSys308 : BasePreDefSystem
    { }
    public class PreDefineSys309 : BasePreDefSystem
    { }
    public class PreDefineSys310 : BasePreDefSystem
    { }


    public class PreDefineSys401 : BasePreDefSystem
    { }
    public class PreDefineSys402 : BasePreDefSystem
    { }
    public class PreDefineSys403 : BasePreDefSystem
    { }
    public class PreDefineSys404 : BasePreDefSystem
    { }
    public class PreDefineSys405 : BasePreDefSystem
    { }
    public class PreDefineSys406 : BasePreDefSystem
    { }
    public class PreDefineSys407 : BasePreDefSystem
    { }
    public class PreDefineSys408 : BasePreDefSystem
    { }
    public class PreDefineSys409 : BasePreDefSystem
    { }
    public class PreDefineSys410 : BasePreDefSystem
    { }


    //单元测试使用
    public class PreDefineSys9991 : BasePreDefSystem
    { }
    public class PreDefineSys9992 : BasePreDefSystem
    { }
    public class PreDefineSys9993 : BasePreDefSystem
    { }
    public class PreDefineSys9994 : BasePreDefSystem
    { }
    public class PreDefineSys9995 : BasePreDefSystem
    { }

#if UNITY_EDITOR
    public static class PreDefineSystemExporter
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp = new List<Type>()
        {
            typeof(PreDefineSys101),
            typeof(PreDefineSys102),
            typeof(PreDefineSys103),
            typeof(PreDefineSys104),
            typeof(PreDefineSys105),
            typeof(PreDefineSys106),
            typeof(PreDefineSys107),
            typeof(PreDefineSys108),
            typeof(PreDefineSys109),
            typeof(PreDefineSys110),
            typeof(PreDefineSys111),
            typeof(PreDefineSys112),
            typeof(PreDefineSys113),
            typeof(PreDefineSys114),
            typeof(PreDefineSys115),
            typeof(PreDefineSys116),
            typeof(PreDefineSys117),
            typeof(PreDefineSys118),
            typeof(PreDefineSys119),
            typeof(PreDefineSys120),
            typeof(PreDefineSys121),
            typeof(PreDefineSys122),
            typeof(PreDefineSys123),
            typeof(PreDefineSys124),
            typeof(PreDefineSys125),
            typeof(PreDefineSys126),
            typeof(PreDefineSys127),
            typeof(PreDefineSys128),
            typeof(PreDefineSys129),
            typeof(PreDefineSys130),
            typeof(PreDefineSys201),
            typeof(PreDefineSys202),
            typeof(PreDefineSys203),
            typeof(PreDefineSys204),
            typeof(PreDefineSys205),
            typeof(PreDefineSys206),
            typeof(PreDefineSys207),
            typeof(PreDefineSys208),
            typeof(PreDefineSys209),
            typeof(PreDefineSys210),
            typeof(PreDefineSys301),
            typeof(PreDefineSys302),
            typeof(PreDefineSys303),
            typeof(PreDefineSys304),
            typeof(PreDefineSys305),
            typeof(PreDefineSys306),
            typeof(PreDefineSys307),
            typeof(PreDefineSys308),
            typeof(PreDefineSys309),
            typeof(PreDefineSys310),
            typeof(PreDefineSys401),
            typeof(PreDefineSys402),
            typeof(PreDefineSys403),
            typeof(PreDefineSys404),
            typeof(PreDefineSys405),
            typeof(PreDefineSys406),
            typeof(PreDefineSys407),
            typeof(PreDefineSys408),
            typeof(PreDefineSys409),
            typeof(PreDefineSys410),
            typeof(PreDefineSys9991),
            typeof(PreDefineSys9992),
            typeof(PreDefineSys9993),
            typeof(PreDefineSys9994),
        };

        [CSharpCallLua]
        public static List<Type> CSharpCallLua = new List<Type>()
        {
            typeof(Action),
        };
    }
#endif
}
