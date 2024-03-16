{
  "$GMObject":"",
  "%Name":"obj_level_obj",
  "eventList":[
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":12,"eventType":7,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_level_obj",
  "overriddenProperties":[],
  "parent":{
    "name":"System",
    "path":"folders/Objects/System.yy",
  },
  "parentObjectId":{
    "name":"obj_gameplay_parent",
    "path":"objects/obj_gameplay_parent/obj_gameplay_parent.yy",
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
    {"$GMObjectProperty":"","%Name":"can_despawn","filters":[],"listItems":[],"multiselect":false,"name":"can_despawn","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"True","varType":3,},
    {"$GMObjectProperty":"","%Name":"zone_index","filters":[],"listItems":[],"multiselect":false,"name":"zone_index","rangeEnabled":true,"rangeMax":255.0,"rangeMin":-3.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-1","varType":1,},
    {"$GMObjectProperty":"","%Name":"level_id","filters":[],"listItems":[],"multiselect":false,"name":"level_id","rangeEnabled":true,"rangeMax":255.0,"rangeMin":-1.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-1","varType":1,},
    {"$GMObjectProperty":"","%Name":"fast_forward","filters":[],"listItems":[],"multiselect":false,"name":"fast_forward","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"True","varType":3,},
    {"$GMObjectProperty":"","%Name":"difficulty","filters":[],"listItems":[
        "\"Easy\"",
        "\"Normal\"",
        "\"Hard\"",
      ],"multiselect":true,"name":"difficulty","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"\"Easy\", \"Normal\", \"Hard\"","varType":6,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":null,
  "spriteMaskId":null,
  "visible":true,
}