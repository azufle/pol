def convertGMU(latitude, longitude):
    from pyproj import Transformer
    transformer = Transformer.from_crs("epsg:32046", "epsg:4326")
    return transformer.transform(latitude, longitude)


def convertNOLA(latitude, longitude):
    from pyproj import Transformer
    transformer = Transformer.from_crs("epsg:26782", "epsg:4326")
    return transformer.transform(latitude, longitude)


def convertSFCO(latitude, longitude):
    from pyproj import Transformer
    transformer = Transformer.from_crs("epsg:26910", "epsg:4326")
    return transformer.transform(latitude, longitude)


def convertATL(latitude, longitude):
    from pyproj import Transformer
    transformer = Transformer.from_crs("epsg:26916", "epsg:4326")
    return transformer.transform(latitude, longitude)


# From GMU map:
# 2341783.638891583 426776.8298143499


coordinateGMU = convertGMU(2341411.392226893, 427009.61483679665)
# coordinateNOLA = convertNOLA(367740.0, 533450.0)
# coordinateSFCO = convertSFCO(551000.0, 414000.0)
# coordinateATL = convertATL(224000.0, 374000.0)

print("GMU: ", coordinateGMU)
# print("NOLA: ", coordinateNOLA)
# print("SFCO: ", coordinateSFCO)
# print("ATL: ", coordinateATL)
