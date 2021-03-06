#ifndef _RTTI
#define _RTTI

typedef enum RTTIType
{
  ABSTRACT_NONE = 0x0,
  ABSTRACT_UNIT = 0x1,
  ABSTRACT_AIRCRAFT = 0x2,
  ABSTRACT_AIRCRAFTTYPE = 0x3,
  ABSTRACT_ANIM = 0x4,
  ABSTRACT_BUILDING = 0x6,
  ABSTRACT_BUILDINGTYPE = 0x7,
  ABSTRACT_BULLET = 0x8,
  ABSTRACT_CELL = 0xB,
  ABSTRACT_FACTORY = 0xC,
  ABSTRACT_HOUSETYPE = 0xE,
  ABSTRACT_INFANTRY = 0xF,
  ABSTRACT_INFTYPE = 0x10,
  ABSTRACT_ISOTILETYPE = 0x12,
  ABSTRACT_SIDE = 0x1C,
  ABSTRACT_SMUDGE = 0x1D,
  ABSTRACT_TERRAIN = 0x24,
  ABSTRACT_TERRAINTYPE = 0x25,
  ABSTRACT_UNITTYPE = 0x28,
  ABSTRACT_EVENT = 0x30,
} RTTIType;

#endif
