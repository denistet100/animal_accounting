package Model;

public class Horse extends PackedAnimals{
    public Horse(String name, String date) {
        super(name, date);
    }

    @Override
    public String toString() {
        return "Horse {" +
                "name = '" + super.getName() + '\'' +
                ", commands = " + super.getCommands() +
                ", dateOfBirth = '" + super.getDateOfBirth() + '\'' +
                '}';
    }
}
