Dog.find_or_create_by(name: "Fido", breed: "Jack Russel Terrier")
Dog.find_or_create_by(name: "Suki", breed: "Chinese Crested")
Dog.find_or_create_by(name: "Misha", breed: "Chinese Crested")

Toy.find_or_create_by(name: "Box", dog_id: 1)
Toy.find_or_create_by(name: "Stick", dog_id: 3)
Toy.find_or_create_by(name: "Sock", dog_id: 2)
