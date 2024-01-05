package Model;

public class PackedAnimals extends Animals {
    public PackedAnimals(String name, String date) {
        super(name, date);
    }

    @Override
    public String toString() {
        return "Packed Animal {" +
                "name = '" + super.getName() + '\'' +
                ", commands = " + super.getCommands() +
                ", dateOfBirth = '" + super.getDateOfBirth() + '\'' +
                '}';
    }
}
