{
  "$GMObject":"",
  "%Name":"obj_spikewall_giant",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":10,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_spikewall_giant",
  "overriddenProperties":[
    {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"obj_level_obj","path":"objects/obj_level_obj/obj_level_obj.yy",},"propertyId":{"name":"fast_forward","path":"objects/obj_level_obj/obj_level_obj.yy",},"resource":null,"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"False",},
  ],
  "parent":{
    "name":"Conveyor Castle",
    "path":"folders/Objects/Levels/Castle Kranion/Conveyor Castle.yy",
  },
  "parentObjectId":{
    "name":"obj_enemy",
    "path":"objects/obj_enemy/obj_enemy.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"speed_move","filters":[],"listItems":[],"multiselect":false,"name":"speed_move","rangeEnabled":true,"rangeMax":8.0,"rangeMin":-8.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"2","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"move_direction","filters":[],"listItems":[
        "\"Left\"",
        "\"Up\"",
        "\"Right\"",
        "\"Down\"",
      ],"multiselect":false,"name":"move_direction","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"\"Right\"","varType":6,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_spike_wall_giant",
    "path":"sprites/spr_spike_wall_giant/spr_spike_wall_giant.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}