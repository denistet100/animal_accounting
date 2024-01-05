package Model;

public class HomeAnimals extends Animals{
    
    public HomeAnimals(String name, String date) {
        super(name, date);
    }

    @Override
    public String toString() {
        return "Home Animals {" +
                "name = '" + super.getName() + '\'' +
                ", commands = " + super.getCommands() +
                ", dateOfBirth = '" + super.getDateOfBirth() + '\'' +
                '}';
    }

}
