{
  "$GMObject":"",
  "%Name":"obj_swinging_chain_parent",
  "eventList":[
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":10,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":12,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":14,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_swinging_chain_parent",
  "overriddenProperties":[],
  "parent":{
    "name":"Common",
    "path":"folders/Objects/Things/Common.yy",
  },
  "parentObjectId":{
    "name":"obj_platform_parent",
    "path":"objects/obj_platform_parent/obj_platform_parent.yy",
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
    {"$GMObjectProperty":"v1","%Name":"chain_segments","filters":[],"listItems":[],"multiselect":false,"name":"chain_segments","rangeEnabled":true,"rangeMax":16.0,"rangeMin":1.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"starting_angle","filters":[],"listItems":[],"multiselect":false,"name":"starting_angle","rangeEnabled":true,"rangeMax":359.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"swing_speed","filters":[],"listItems":[],"multiselect":false,"name":"swing_speed","rangeEnabled":true,"rangeMax":4.0,"rangeMin":-4.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"circle_angle","filters":[],"listItems":[
        "45",
        "90",
        "180",
        "270",
        "360",
      ],"multiselect":false,"name":"circle_angle","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"90","varType":6,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_chain",
    "path":"sprites/spr_chain/spr_chain.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}