return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 12,
  properties = {
    ["light"] = true
  },
  tilesets = {
    {
      name = "stadium_light",
      firstgid = 1,
      filename = "../tilesets/stadium_light.tsx"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 1,
      name = "Tiles",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        28, 29, 29, 29, 29, 29, 29, 29, 29, 29, 30, 31, 13, 14, 15, 31,
        34, 35, 35, 35, 35, 35, 35, 35, 35, 35, 36, 31, 13, 14, 15, 31,
        34, 35, 35, 35, 35, 35, 35, 35, 35, 35, 36, 31, 13, 14, 15, 31,
        34, 35, 35, 35, 35, 35, 35, 35, 35, 35, 36, 31, 13, 14, 15, 31,
        34, 35, 35, 35, 35, 35, 35, 35, 35, 35, 36, 31, 13, 14, 15, 31,
        40, 41, 41, 41, 41, 41, 41, 41, 41, 41, 42, 31, 13, 14, 15, 31,
        31, 13, 14, 15, 31, 32, 31, 32, 31, 32, 31, 32, 13, 14, 15, 31,
        32, 13, 14, 15, 32, 31, 32, 31, 32, 31, 32, 31, 13, 14, 15, 31,
        31, 13, 14, 14, 8, 8, 8, 8, 8, 8, 8, 8, 14, 14, 15, 31,
        31, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 31,
        31, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 31,
        31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "collisions",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 200,
          width = 280,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 200,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 480,
          width = 680,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 0,
          width = 40,
          height = 480,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 0,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "elevatordoor",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 200,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 440,
          y = -40,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "stadium",
            ["marker"] = "entry"
          }
        },
        {
          id = 5,
          name = "interactable",
          type = "",
          shape = "point",
          x = 390,
          y = -105,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = "* (There's a giant toilet-shaped toilet blocking your way.)",
            ["text2"] = "* (That can only mean that this area is unfinished.)",
            ["texture"] = "toilet"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 3,
          name = "entry_elevator",
          type = "",
          shape = "point",
          x = 100,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "entry",
          type = "",
          shape = "point",
          x = 540,
          y = 40,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
