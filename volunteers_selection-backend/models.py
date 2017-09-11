class Observatory(Resource):
    def get(self):
        return {
            'Galaxies': ['Milkyway', 'Andromeda', 
            'Large Magellanic Cloud (LMC)']
        }

#Class Attribute(Resource):
#   __tablename__ = 'Attribute'
#    id = Column(Integer, primary_key=True, nullable=False) 
#    name = Column(Float)
#    value = Column(Float)
#    weight = Column(Float)
#
#    def get(self):
#        return {
#            'Galaxies': ['Milkyway', 'Andromeda', 
#            'Large Magellanic Cloud (LMC)']
#        }


#Class Dimension(Resource):
#   __tablename__ = 'Dimension'
#    def get(self):
#        return {
#            'Galaxies': ['Milkyway', 'Andromeda', 
#            'Large Magellanic Cloud (LMC)']
#        }

