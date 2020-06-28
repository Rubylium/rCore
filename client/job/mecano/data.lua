Colors = {
	{ label = "noir", value = 'black', basePrice = 1200},
	{ label = "blanc", value = 'white', basePrice = 1200},
	{ label = "gris", value = 'grey', basePrice = 1200},
	{ label = "rouge", value = 'red', basePrice = 1200},
	{ label = "rose", value = 'pink', basePrice = 1200},
	{ label = "bleu", value = 'blue', basePrice = 1200},
	{ label = "jaune", value = 'yellow', basePrice = 1200},
	{ label = "vert", value = 'green', basePrice = 1200},
	{ label = "orange", value = 'orange', basePrice = 1200},
	{ label = "marron", value = 'brown', basePrice = 1200},
	{ label = "violet", value = 'purple', basePrice = 1200},
	{ label = "chrome", value = 'chrome', basePrice = 1200},
	{ label = "or", value = 'gold', basePrice = 1200}
}

animations = {
    {
        nom = "Changer des pièces debout",
        command = "e mechanic",
    },
    {
        nom = "Changer des pièces debout 2",
        command = "e mechanic4",
    },
    {
        nom = "Changer des pièces accroupie",
        command = "e mechanic3",
    },
}


Interne = {
	{
		name = "Moteur",
		modType = 11,
		basePrice = 12000,
	},
	{
		name = "Frein",
		modType = 12,
		basePrice = 11500,
	},
	{
		name = "Transmission",
		modType = 13,
		basePrice = 8500,
	},
	{
		name = "Suspension",
		modType = 15,
		basePrice = 8500,
	},
	{
		name = "Turbo",
		modType = 17,
		basePrice = 25000,
	},
}

Externe = {
	{
		name = "Aileron",
		modType = 0,
		basePrice = 600,
	},
	{
		name = "Pare-choc avant",
		modType = 1,
		basePrice = 750,
	},
	{
		name = "Pare-choc arrière",
		modType = 2,
		basePrice = 750,
	},
	{
		name = "Bas de caisse",
		modType = 3,
		basePrice = 300,
	},
	{
		name = "Pot d'échappement",
		modType = 4,
		basePrice = 800,
	},
	{
		name = "Cage",
		modType = 5,
		basePrice = 1000,
	},
	{
		name = "Grille",
		modType = 6,
		basePrice = 500,
	},
	{
		name = "Capot",
		modType = 7,
		basePrice = 350,
	},
	{
		name = "Aile gauche",
		modType = 8,
		basePrice = 400,
	},
	{
		name = "Aile droite",
		modType = 9,
		basePrice = 400,
	},
	{
		name = "Toit",
		modType = 10,
		basePrice = 650,
	},
	{
		name = "Claxon",
		modType = 14,
		basePrice = 5500,
	},
	{
		name = "Roue", -- a retaper
		modType = 23,
		basePrice = 1200,
	},
	{
		name = "Plaque",
		modType = 25,
		basePrice = 3200,
	},
	{
		name = "porte plaque avant",
		modType = 26,
		basePrice = 1200,
	},
	{
		name = "Trim",
		modType = 27,
		basePrice = 1200,
	},
	{
		name = "Ornement",
		modType = 28,
		basePrice = 1200,
	},
	{
		name = "Interieur",
		modType = 29,
		basePrice = 1200,
	},
	{
		name = "Tableau de bord +",
		modType = 30,
		basePrice = 1200,
	},
	{
		name = "Speaker de porte",
		modType = 31,
		basePrice = 1200,
	},
	{
		name = "Sièges",
		modType = 32,
		basePrice = 1200,
	},
	{
		name = "Volant",
		modType = 33,
		basePrice = 1200,
	},
	{
		name = "Levier de vitesse",
		modType = 34,
		basePrice = 1200,
	},
	{
		name = "plaque",
		modType = 35,
		basePrice = 1200,
	},
	{
		name = "Speakers",
		modType = 36,
		basePrice = 1200,
	},
	{
		name = "Coffre",
		modType = 37,
		basePrice = 1200,
	},
	{
		name = "Suspension hydraulique",
		modType = 38,
		basePrice = 1200,
	},
	{
		name = "Bloc moteur",
		modType = 39,
		basePrice = 1200,
	},
	{
		name = "Flitre à air",
		modType = 40,
		basePrice = 1200,
	},
	{
		name = "Jambe de suspension",
		modType = 41,
		basePrice = 1200,
	},
	{
		name = "Contour phare",
		modType = 42,
		basePrice = 1200,
	},
	{
		name = "Antenne",
		modType = 43,
		basePrice = 1200,
	},
	{
		name = "Prise d'air",
		modType = 44,
		basePrice = 1200,
	},
	{
		name = "Réservoir",
		modType = 45,
		basePrice = 1200,
	},
	{
		name = "Déflécteur",
		modType = 46,
		basePrice = 1200,
	},
	{
		name = "UNK47",
		modType = 47,
		basePrice = 1200,
	},
	{
		name = "Liverys",
		modType = 48,
		basePrice = 1200,
	},
}


weels = {
	{
		name = "Sports",
		type = 0,
	},
	{
		name = "Muscle",
		type = 1,
	},
	{
		name = "Lowrider",
		type = 2,
	},
	{
		name = "SUV",
		type = 3,
	},
	{
		name = "Offroad",
		type = 4,
	},
	{
		name = "Tuning",
		type = 5,
	},
	{
		name = "Moto",
		type = 6,
	},
	{
		name = "Highend",
		type = 7,
	},
}



function GetColors(color)
	local colors = {}
	if color == 'black' then
		colors = {
			{ index = 0, label = "noir"},
			{ index = 1, label = "graphite"},
			{ index = 2, label = "noir Méttallisé"},
			{ index = 3, label = "acier Fondu"},
			{ index = 11, label = "noir Anthracite"},
			{ index = 12, label = "noir Mat"},
			{ index = 15, label = "nuit Sombre"},
			{ index = 16, label = "noir Profond"},
			{ index = 21, label = "pétrol"},
			{ index = 147, label = "carbon"}
		}
	elseif color == 'white' then
		colors = {
			{ index = 106, label = "vanille"},
			{ index = 107, label = "crème"},
			{ index = 111, label = "blanc"},
			{ index = 112, label = "blanc Polair"},
			{ index = 113, label = "beige"},
			{ index = 121, label = "blanc Mat"},
			{ index = 122, label = "neige"},
			{ index = 131, label = "coton"},
			{ index = 132, label = "albâtre"},
			{ index = 134, label = "blanc Pure"}
		}
	elseif color == 'grey' then
		colors = {
			{ index = 4, label = "Argenté"},
			{ index = 5, label = "Gris Métallisé"},
			{ index = 6, label = "Acier Laminé"},
			{ index = 7, label = "Gris Foncé"},
			{ index = 8, label = "Gris Rocheux"},
			{ index = 9, label = "Gris Nuit"},
			{ index = 10, label = "Aluminium"},
			{ index = 13, label = "Gris Mat"},
			{ index = 14, label = "Gris Clair"},
			{ index = 17, label = "Gris Bitume"},
			{ index = 18, label = "Gris Béton"},
			{ index = 19, label = "Argent Sombre"},
			{ index = 20, label = "Magnésite"},
			{ index = 22, label = "nickel"},
			{ index = 23, label = "zinc"},
			{ index = 24, label = "dolomite"},
			{ index = 25, label = "Argent Bleuté"},
			{ index = 26, label = "Titane"},
			{ index = 66, label = "Acier Bleue"},
			{ index = 93, label = "Champagne"},
			{ index = 144, label = "Gris Chasseur"},
			{ index = 156, label = "gris"}
		}
	elseif color == 'red' then
		colors = {
			{ index = 27, label = "rouge"},
			{ index = 28, label = "Rouge Turin"},
			{ index = 29, label = "Coquelicot"},
			{ index = 30, label = "Rouge Cuivré"},
			{ index = 31, label = "Rouge Cardinal"},
			{ index = 32, label = "Rouge Brique"},
			{ index = 33, label = "Grenat"},
			{ index = 34, label = "Pourpre"},
			{ index = 35, label = "Framboise"},
			{ index = 39, label = "Rouge Mat"},
			{ index = 40, label = "Rouge Foncé"},
			{ index = 43, label = "Rouge Pulpeux"},
			{ index = 44, label = "Rouge Brillant"},
			{ index = 46, label = "Rouge Pale"},
			{ index = 143, label = "Rouge Vin"},
			{ index = 150, label = "Volcano"}
		}
	elseif color == 'pink' then
		colors = {
			{ index = 135, label = "rose Electrique"},
			{ index = 136, label = "rose Saumon"},
			{ index = 137, label = "rose Dragée"}
		}
	elseif color == 'blue' then
		colors = {
			{ index = 54, label = "topaze"},
			{ index = 60, label = "bleu clair"},
			{ index = 61, label = "bleu galaxy"},
			{ index = 62, label = "bleu foncé"},
			{ index = 63, label = "bleu azur"},
			{ index = 64, label = "bleu marine"},
			{ index = 65, label = "lapis lazuli"},
			{ index = 67, label = "bleu diamant"},
			{ index = 68, label = "surfer"},
			{ index = 69, label = "pastel"},
			{ index = 70, label = "bleu celeste"},
			{ index = 73, label = "bleu rally"},
			{ index = 74, label = "bleu paradis"},
			{ index = 75, label = "bleu nuit"},
			{ index = 77, label = "bleu cyan"},
			{ index = 78, label = "cobalt"},
			{ index = 79, label = "bleu electrique"},
			{ index = 80, label = "bleu horizon"},
			{ index = 82, label = "bleu métallisé"},
			{ index = 83, label = "aigue marine"},
			{ index = 84, label = "bleu agathe"},
			{ index = 85, label = "zirconium"},
			{ index = 86, label = "spinelle"},
			{ index = 87, label = "tourmaline"},
			{ index = 127, label = "paradis"},
			{ index = 140, label = "bubble gum"},
			{ index = 141, label = "bleu minuit"},
			{ index = 146, label = "bleu interdit"},
			{ index = 157, label = "bleu glacier"}
		}
	elseif color == 'yellow' then
		colors = {
			{ index = 42, label = "jaune"},
			{ index = 88, label = "Jaune Blé"},
			{ index = 89, label = "Jaune Rally"},
			{ index = 91, label = "Jaune Clair"},
			{ index = 126, label = "Jaune Pâle"}
		}
	elseif color == 'green' then
		colors = {
			{ index = 49, label = "Vert Foncé"},
			{ index = 50, label = "Vert Rally"},
			{ index = 51, label = "Vert Sapin"},
			{ index = 52, label = "Vert Olive"},
			{ index = 53, label = "Vert Clair"},
			{ index = 55, label = "Vert Lime"},
			{ index = 56, label = "Vert Forêt"},
			{ index = 57, label = "Vert Pelouse"},
			{ index = 58, label = "Vert Impérial"},
			{ index = 59, label = "Vert Bouteille"},
			{ index = 92, label = "Vert Citrus"},
			{ index = 125, label = "Vert Anis"},
			{ index = 128, label = "Kaki"},
			{ index = 133, label = "Vert Army"},
			{ index = 151, label = "Vert Sombre"},
			{ index = 152, label = "Vert Chasseur"},
			{ index = 155, label = "Amarylisse"}
		}
	elseif color == 'orange' then
		colors = {
			{ index = 36, label = "Tangerine"},
			{ index = 38, label = "orange"},
			{ index = 41, label = "Orange Mat"},
			{ index = 123, label = "Orange Clair"},
			{ index = 124, label = "Pèche"},
			{ index = 130, label = "Citrouille"},
			{ index = 138, label = "Orange Lambo"}
		}
	elseif color == 'brown' then
		colors = {
			{ index = 45, label = "Cuivre"},
			{ index = 47, label = "Marronclair"},
			{ index = 48, label = "Marron Foncé"},
			{ index = 90, label = "Bronze"},
			{ index = 94, label = "Marron Métallisé"},
			{ index = 95, label = "Expresso"},
			{ index = 96, label = "Chocolat"},
			{ index = 97, label = "Terre Cuite"},
			{ index = 98, label = "Marbre"},
			{ index = 99, label = "Sable"},
			{ index = 100, label = "Sépia"},
			{ index = 101, label = "Bison"},
			{ index = 102, label = "Palmier"},
			{ index = 103, label = "Caramel"},
			{ index = 104, label = "Rouille"},
			{ index = 105, label = "Chataigne"},
			{ index = 108, label = "marron"},
			{ index = 109, label = "Noisette"},
			{ index = 110, label = "Coquillage"},
			{ index = 114, label = "Acajou"},
			{ index = 115, label = "Chaudron"},
			{ index = 116, label = "Blond"},
			{ index = 129, label = "Gravillon"},
			{ index = 153, label = "Terre Foncé"},
			{ index = 154, label = "Désert"}
		}
	elseif color == 'purple' then
		colors = {
			{ index = 71, label = "Indigo"},
			{ index = 72, label = "Violet Profond"},
			{ index = 76, label = "Violet Foncé"},
			{ index = 81, label = "Améthyste"},
			{ index = 142, label = "Violet Mystique"},
			{ index = 145, label = "Violet Métallisé"},
			{ index = 148, label = "Violet Mat"},
			{ index = 149, label = "Violet Profond Mat"}
		}
	elseif color == 'chrome' then
		colors = {
			{ index = 117, label = "chrome Brossé"},
			{ index = 118, label = "chrome Noir"},
			{ index = 119, label = "aluminum Brossé"},
			{ index = 120, label = "chrome"}
		}
	elseif color == 'gold' then
		colors = {
			{ index = 37, label = "or"},
			{ index = 158, label = "Or Pure"},
			{ index = 159, label = "Or Brossé"},
			{ index = 160, label = "Or Clair"}
		}
	end
	return colors
end

function GetWindowName(index)
	if (index == 1) then
		return "Pure Black"
	elseif (index == 2) then
		return "Darksmoke"
	elseif (index == 3) then
		return "Lightsmoke"
	elseif (index == 4) then
		return "Limo"
	elseif (index == 5) then
		return "Green"
	else
		return "Unknown"
	end
end

function GetHornName(index)
	if (index == 0) then
		return "Truck Horn"
	elseif (index == 1) then
		return "Cop Horn"
	elseif (index == 2) then
		return "Clown Horn"
	elseif (index == 3) then
		return "Musical Horn 1"
	elseif (index == 4) then
		return "Musical Horn 2"
	elseif (index == 5) then
		return "Musical Horn 3"
	elseif (index == 6) then
		return "Musical Horn 4"
	elseif (index == 7) then
		return "Musical Horn 5"
	elseif (index == 8) then
		return "Sad Trombone"
	elseif (index == 9) then
		return "Classical Horn 1"
	elseif (index == 10) then
		return "Classical Horn 2"
	elseif (index == 11) then
		return "Classical Horn 3"
	elseif (index == 12) then
		return "Classical Horn 4"
	elseif (index == 13) then
		return "Classical Horn 5"
	elseif (index == 14) then
		return "Classical Horn 6"
	elseif (index == 15) then
		return "Classical Horn 7"
	elseif (index == 16) then
		return "Scale - Do"
	elseif (index == 17) then
		return "Scale - Re"
	elseif (index == 18) then
		return "Scale - Mi"
	elseif (index == 19) then
		return "Scale - Fa"
	elseif (index == 20) then
		return "Scale - Sol"
	elseif (index == 21) then
		return "Scale - La"
	elseif (index == 22) then
		return "Scale - Ti"
	elseif (index == 23) then
		return "Scale - Do"
	elseif (index == 24) then
		return "Jazz Horn 1"
	elseif (index == 25) then
		return "Jazz Horn 2"
	elseif (index == 26) then
		return "Jazz Horn 3"
	elseif (index == 27) then
		return "Jazz Horn Loop"
	elseif (index == 28) then
		return "Star Spangled Banner 1"
	elseif (index == 29) then
		return "Star Spangled Banner 2"
	elseif (index == 30) then
		return "Star Spangled Banner 3"
	elseif (index == 31) then
		return "Star Spangled Banner 4"
	elseif (index == 32) then
		return "Classical Horn 8 Loop"
	elseif (index == 33) then
		return "Classical Horn 9 Loop"
	elseif (index == 34) then
		return "Classical Horn 10 Loop"
	elseif (index == 35) then
		return "Classical Horn 8"
	elseif (index == 36) then
		return "Classical Horn 9"
	elseif (index == 37) then
		return "Classical Horn 10"
	elseif (index == 38) then
		return "Funeral Loop"
	elseif (index == 39) then
		return "Funeral"
	elseif (index == 40) then
		return "Spooky Loop"
	elseif (index == 41) then
		return "Spooky"
	elseif (index == 42) then
		return "San Andreas Loop"
	elseif (index == 43) then
		return "San Andreas"
	elseif (index == 44) then
		return "Liberty City Loop"
	elseif (index == 45) then
		return "Liberty City"
	elseif (index == 46) then
		return "Festive 1 Loop"
	elseif (index == 47) then
		return "Festive 1"
	elseif (index == 48) then
		return "Festive 2 Loop"
	elseif (index == 49) then
		return "Festive 2"
	elseif (index == 50) then
		return "Festive 3 Loop"
	elseif (index == 51) then
		return "Festive 3"
	else
		return "Unknown Horn"
	end
end

function GetNeons()
	local neons = {
		{ label = "Blanc",		r = 255, 	g = 255, 	b = 255},
		{ label = "Slate Gray",		r = 112, 	g = 128, 	b = 144},
		{ label = "Blue",			r = 0, 		g = 0, 		b = 255},
		{ label = "Light Blue",		r = 0, 		g = 150, 	b = 255},
		{ label = "Navy Blue", 		r = 0, 		g = 0, 		b = 128},
		{ label = "Sky Blue", 		r = 135, 	g = 206, 	b = 235},
		{ label = "Turquoise", 		r = 0, 		g = 245, 	b = 255},
		{ label = "Mint Green", 	r = 50, 	g = 255, 	b = 155},
		{ label = "Lime Green", 	r = 0, 		g = 255, 	b = 0},
		{ label = "Olive", 			r = 128, 	g = 128, 	b = 0},
		{ label = "Jaune", 	r = 255, 	g = 255, 	b = 0},
		{ label = "Or", 		r = 255, 	g = 215, 	b = 0},
		{ label = "Orange", 	r = 255, 	g = 165, 	b = 0},
		{ label = "Blé", 		r = 245, 	g = 222, 	b = 179},
		{ label = "Rouge", 		r = 255, 	g = 0, 		b = 0},
		{ label = "Rose", 		r = 255, 	g = 161, 	b = 211},
		{ label = "Rose clair",	r = 255, 	g = 0, 		b = 255},
		{ label = "Violet", 	r = 153, 	g = 0, 		b = 153},
		{ label = "Ivory", 			r = 41, 	g = 36, 	b = 33}
	}

	return neons
end

function GetWindowName(index)
	if (index == 1) then
		return "Pure Black"
	elseif (index == 2) then
		return "Darksmoke"
	elseif (index == 3) then
		return "Lightsmoke"
	elseif (index == 4) then
		return "Limo"
	elseif (index == 5) then
		return "Green"
	else
		return "Unknown"
	end
end


function GetPlatesName(index)
	if (index == 0) then
		return "Bleu sur blanc"
	elseif (index == 1) then
		return "Jaune sur noir"
	elseif (index == 2) then
		return "jaune et bleu"
	elseif (index == 3) then
		return "Bleu sur blanc 2"
	elseif (index == 4) then
		return "Bleu sur blanc"
	end
end