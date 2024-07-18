{
  "$GMObject":"",
  "%Name":"obj_enemy_missile",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":10,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_enemy_missile",
  "overriddenProperties":[
    {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"obj_level_obj","path":"objects/obj_level_obj/obj_level_obj.yy",},"propertyId":{"name":"zone_index","path":"objects/obj_level_obj/obj_level_obj.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"-3",},
  ],
  "parent":{
    "name":"Enemy Weapons",
    "path":"folders/Objects/Enemies/Enemy Weapons.yy",
  },
  "parentObjectId":{
    "name":"obj_level_obj",
    "path":"objects/obj_level_obj/obj_level_obj.yy",
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
    {"$GMObjectProperty":"v1","%Name":"speed","filters":[],"listItems":[],"multiselect":false,"name":"speed","rangeEnabled":true,"rangeMax":16.0,"rangeMin":1.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1","varType":1,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_enemy_fireball",
    "path":"sprites/spr_enemy_fireball/spr_enemy_fireball.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}