package Model;

public class Donkey extends PackedAnimals{
    public Donkey(String name, String date) {
        super(name, date);
    }

    @Override
    public String toString() {
        return "Donkey {" +
                "name = '" + super.getName() + '\'' +
                ", commands = " + super.getCommands() +
                ", dateOfBirth = '" + super.getDateOfBirth() + '\'' +
                '}';
    }
}
