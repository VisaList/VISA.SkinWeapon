Config = {}

Config["IMG"] = "nui://esx_inventoryhud/html/img/items/"  --> @ ที่อยู่รูปภาพ

Config["SETTING"] = {
    ["OPENMENUKEY"] = "F2", --> @ ปุ่มเปิดเมนู
    ["OPENMENUCOMMAND"] = "WEAPONSKINMENU", --> @ ปุ่มเปิดเมนู
}

Config["WEAPONPOSITION"] = { --> @ ตำแหน่งการถือของอาวุธแต่ละชนิด
    ["WEAPON_POOLCUE"] = {
        Pos =  {x = 0.080, y = -0.025, z = -0.020},
		Rot =  {x = -85.000, y = -16.000, z = -23.000},
    },
    ["WEAPON_BAT"] = {
        Pos =  {x = 0.080, y = -0.025, z = -0.020},
		Rot =  {x = -85.000, y = -16.000, z = -23.000},
    },
    ["WEAPON_GOLFCLUB"] = {
        Pos =  {x = 0.080, y = -0.025, z = -0.020},
		Rot =  {x = -85.000, y = -16.000, z = -23.000},
    },
    ["WEAPON_BOTTLE"] = {
        Pos =  {x = 0.055, y = 0.000, z = 0.000},
		Rot =  {x = -86.000, y = 29.000, z = -11.000},
    },
    ["WEAPON_SWITCHBLADE"] = {
        Pos =  {x = 0.085, y = 0.010, z = -0.035},
		Rot =  {x = 37.000, y = 66.000, z = 82.000},
    },
    ["WEAPON_KNIFE"] = {
        Pos =  {x = 0.085, y = 0.000, z = -0.015},
		Rot =  {x = -86.000, y = 9.000, z = -20.000},
    },
    ["WEAPON_DAGGER"] = {
        Pos =  {x = 0.085, y = 0.000, z = -0.015},
		Rot =  {x = -86.000, y = 9.000, z = -20.000},
    },
    

    --- แก้
    ["WEAPON_KNUCKLE"] = {
        Pos =  {x = 0.100, y = 0.000, z = 0.010},
		Rot =  {x = -100.000, y = -6.000, z = -10.000},
    },
    --- แก้

    ["WEAPON_REVOLVER"] = {
        Pos =  {x = 0.150, y = 0.045, z = 0.010},
		Rot =  {x = -64.000, y = -6.000, z = -10.000},
    },
    ["WEAPON_MACHETE"] = {
        Pos =  {x = 0.080, y = -0.005, z = -0.020},
		Rot =  {x = -84.000, y = 13.000, z = -21.000},
    }
}

Config['CATEGORY'] = {
    [1] = 'ALL',
}

Config["WEAPONSKIN"] = {

    {---POOLLV3
        ["MAIN"] = "WEAPON_POOLCUE", --> @ ชื่ออาวุธหลัก ที่ใช้ในการสวม
        ["POSITION"] = "WEAPON_POOLCUE", --> @ ตำแหน่งการถือของอาวุธดึงจากหัวข้ออาวุธ Config["WEAPONPOSITION"]
        ["NAME"] = "POOLCUE", --> @ ชื่อแสดงอาวุธ
        ["ITEMWEAPON"] = false, --> @ อาวุธเป็นรูปแบบไอเทมหรือไม่
        ["CATEGORY"] = 'ALL',
        ["SKIN"] = {

            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_POOLCUE", --> @ รูปสกินอาวุธ
                ["NAME"] = "WEAPON_POOLCUE", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "WEAPON_POOLCUE", --> @ ชื่อแสดงสกินอาวุธ
            },
         
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_POOLCUE", --> @ รูปสกินอาวุธ
                ["NAME"] = "w_me_dessert_poolcue", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "w_me_dessert_poolcue", --> @ ชื่อแสดงสกินอาวุธ
            },
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_POOLCUE", --> @ รูปสกินอาวุธ
                ["NAME"] = "w_me_dessert_bat", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "w_me_dessert_bat", --> @ ชื่อแสดงสกินอาวุธ
            },
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_POOLCUE", --> @ รูปสกินอาวุธ
                ["NAME"] = "w_me_dessert_golfclub", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "w_me_dessert_golfclub", --> @ ชื่อแสดงสกินอาวุธ
            },
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_POOLCUE", --> @ รูปสกินอาวุธ
                ["NAME"] = "babyphoto_poolcue_desserts", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "babyphoto_poolcue_desserts", --> @ ชื่อแสดงสกินอาวุธ
            },
            
            
        }
    },

    {---KNIFE
        ["MAIN"] = "WEAPON_KNIFE", --> @ ชื่ออาวุธหลัก ที่ใช้ในการสวม
        ["POSITION"] = "WEAPON_KNIFE", --> @ ตำแหน่งการถือของอาวุธดึงจากหัวข้ออาวุธ Config["WEAPONPOSITION"]
        ["NAME"] = "KNIFE", --> @ ชื่อแสดงอาวุธ
        ["ITEMWEAPON"] = false, --> @ อาวุธเป็นรูปแบบไอเทมหรือไม่
        ["CATEGORY"] = 'ALL',
        ["SKIN"] = {
        
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_KNIFE", --> @ รูปสกินอาวุธ
                ["NAME"] = "w_me_dessert_fork", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "w_me_dessert_fork", --> @ ชื่อแสดงสกินอาวุธ
            },
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_KNIFE", --> @ รูปสกินอาวุธ
                ["NAME"] = "babyphoto_knife_desserts", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "babyphoto_knife_desserts", --> @ ชื่อแสดงสกินอาวุธ
            },
            
            
        }
    },

    {---BOTTLE
        ["MAIN"] = "WEAPON_BOTTLE", --> @ ชื่ออาวุธหลัก ที่ใช้ในการสวม
        ["POSITION"] = "WEAPON_BOTTLE", --> @ ตำแหน่งการถือของอาวุธดึงจากหัวข้ออาวุธ Config["WEAPONPOSITION"]
        ["NAME"] = "BOTTLE", --> @ ชื่อแสดงอาวุธ
        ["ITEMWEAPON"] = false, --> @ อาวุธเป็นรูปแบบไอเทมหรือไม่
        ["CATEGORY"] = 'ALL',
        ["SKIN"] = {
        
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_BOTTLE", --> @ รูปสกินอาวุธ
                ["NAME"] = "w_me_dessert_bottle", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "w_me_dessert_bottle", --> @ ชื่อแสดงสกินอาวุธ
            },
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_BOTTLE", --> @ รูปสกินอาวุธ
                ["NAME"] = "babyphoto_bottle_desserts", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "babyphoto_bottle_desserts", --> @ ชื่อแสดงสกินอาวุธ
            },
            
            
        }
    },

    {---REVOLVER
        ["MAIN"] = "WEAPON_REVOLVER", --> @ ชื่ออาวุธหลัก ที่ใช้ในการสวม
        ["POSITION"] = "WEAPON_REVOLVER", --> @ ตำแหน่งการถือของอาวุธดึงจากหัวข้ออาวุธ Config["WEAPONPOSITION"]
        ["NAME"] = "REVOLVER", --> @ ชื่อแสดงอาวุธ
        ["ITEMWEAPON"] = false, --> @ อาวุธเป็นรูปแบบไอเทมหรือไม่
        ["CATEGORY"] = 'ALL',
        ["SKIN"] = {
        
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_REVOLVER", --> @ รูปสกินอาวุธ
                ["NAME"] = "w_pi_dessert_gun", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "w_pi_dessert_gun", --> @ ชื่อแสดงสกินอาวุธ
            },
            {---------------------------โต๊คราฟ   
                ["ITEMUSE"] = "iron", --> @ ไอเทมที่ต้องใช้เพื่อใส่สกิน
                ["IMAGE"] = "WEAPON_REVOLVER", --> @ รูปสกินอาวุธ
                ["NAME"] = "babyphoto_revolver_desserts", --> @ โมเดลสกินอาวุธ
                ["SKINNAME"] = "babyphoto_revolver_desserts", --> @ ชื่อแสดงสกินอาวุธ
            },
            
            
        }
    },
    
}
