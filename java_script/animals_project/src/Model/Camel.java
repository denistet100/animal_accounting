package Model;

public class Camel extends PackedAnimals{
    public Camel(String name, String date) {
        super(name, date);
    }

    @Override
    public String toString() {
        return "Camel {" +
                "name = '" + super.getName() + '\'' +
                ", commands = " + super.getCommands() +
                ", dateOfBirth = '" + super.getDateOfBirth() + '\'' +
                '}';
    }
}