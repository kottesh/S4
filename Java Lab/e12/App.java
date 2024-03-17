import java.util.*;

/**
 *  Author: kottesh
 *  Date: 17-03-2024
 *  Title: Banking Simulation
 */

class Bank {
    private String name;
    private int estYear; 
    private String chairman;
    private String registeredAddress;
    
    private Branch headOffice;
    //need to have the 
    private List<Branch> branchOffice;
    private List<Branch> zonalOffice;
    private List<Branch> regionalOffice;

    private List<Account> accounts;

    Bank(String name, int estYear, String chairman, String registeredAddress) {
        this.name = name;
        this.estYear = estYear;
        this.chairman = chairman;
        this.registeredAddress = registeredAddress;

        this.accounts = new ArrayList<> (); 

        this.branchOffice = new ArrayList<> ();
        this.regionalOffice = new ArrayList<> ();
        this.zonalOffice = new ArrayList<> ();
    }

    public void addBranch(final String type, Branch branch) {
        switch(type.toLowerCase()) {
            case "branch": {
                branchOffice.add(branch);
                break;
            }
            case "regional": {
                regionalOffice.add(branch);
                break;
            }
            case "zonal": {
                zonalOffice.add(branch);
                break;
            }
            default: {
                System.out.println("BRANCH TYPE NOT FOUND: " + type);
            }
        }
    }

    public void removeBranch(final String type, final String branchId) {
        switch(type.toLowerCase()) {
            case "branch": {
                branchOffice.remove(findBranch(type, branchOffice));
                break;
            }
            case "regional": {
                regionalOffice.remove(findBranch(type, regionalOffice));
                break;
            }
            case "zonal": {
                zonalOffice.remove(findBranch(type, zonalOffice));
                break;
            }
            default: {
                System.out.println("BRANCH TYPE NOT FOUND: " + type);
            }
        }
    }

    Branch findBranch(final String branchId, List<Branch> branches) {
        for(Branch branch:branches) {
            if(branch.branchId.equals(branchId)) {
                return branch;
            }
        }
        return null;
    }

    public void showAllBranches() {}

    //TODO: this doesn't belong here. (figure out where it should.)
    protected Account findAccount(long accNo) {
        for(Account acc : accounts) {
            if(acc.accountNo == accNo) {
                return acc; 
            }
        }
        return null;
    }
}

class Branch {
    private String name; //branchname  
    private String address; 
    protected String branchId; 
    private List<Employee> employees;

    Branch(
        String name, String address, 
        Employee manager, Employee assistantManager 
    ) {
        this.name = name;
        this.address = address;
        this.branchId = String.valueOf((new Random()).nextLong(10000000000L)); 
        employees.add(manager);
        employees.add(assistantManager);
    }

    public void addEmployees(Employee ) {
        employees.add();
    }
}

class Employee extends Person {
    private String designation; 
    private float salary;

    Employee(String designation, float salary) {
        this.designation = designation;
        this.salary = salary;
    }
}

class Person {
    private String name;  
    private int age;
    private String dob;
    private String address; 
    private String phoneNumber;
    private String email;
    private String aadhaarNo;

    Person(
        String name, int age, String dob,
        String address, String phoneNumber, String email, String aadhaarNo  
    ) {
        this.name = name;
        this.age = age;
        this.dob = dob;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.aadhaarNo = aadhaarNo;
    }

    private void showDetails() {
        System.out.println("Name         : " + this.name);
        System.out.println("Age          : " + this.age);
        System.out.println("Address      : " + this.address);
        System.out.println("Phone Number : " + this.phoneNumber);
        System.out.println("Email ID     : " + this.email);
        System.out.println("Aadhaar No   : " + this.aadhaarNo);
    }
}

// TODO: classifying customer into RETAIL and CORPORATE
class Customer extends Person {
    private Account account;

    Customer (
        Bank bank, String name, int age, String dob,
        String address, String phoneNumber, String email, String aadhaarNo,
        float initialFund, String type
    ) {
        super(name, age, dob, address, phoneNumber, email, aadhaarNo);
        account = new Account(bank, initialFund);
    }

    public void closeAccount(long accNo) {
        
    }
}

class Account {
    private Bank bank; //bank reference to access it's methods 

    protected long accountNo; 
    protected float balance; 

    Account(Bank bank, float initialBalance) {
        this.bank = bank;
        this.accountNo = generateAcNumber();
        this.balance = initialBalance;
    } 

    public void showAcDetails() {
        System.out.println("Account No: " + this.accountNo);
        System.out.println("Balance   :" + this.balance);
    }

    public void deposit(float amount) {
        if( !(amount <= 0) ) {
            this.balance += amount;
            System.out.println("Deposited: " + amount);
            System.out.println("Current Balance: " + this.balance);
        } else {
            System.out.println("Invalid deposit amount: " + amount);
        }
    }

    public void withdraw(float amount) {
        if( amount <= 0 ) {
            System.out.println("Invalid Amount: " + amount);
            return;
        }
        if( (balance - amount) <= 0 ) {
            System.out.println("Insufficient Balance: " + this.balance);
            return;
        }
        this.balance -= amount;
        System.out.println("Withdrawn: " + amount);
        System.out.println("Current Balance: " + this.balance);
    }

    public void transfer(long toAcNo, float amount) {
        Account receiver = bank.findAccount(toAcNo); 

        if(receiver == null) {
            System.out.println("Account(" + toAcNo + ") NOT FOUND!");
            return;
        } 
        if(amount <= 0) {
            System.out.println("Invalid Amount: " + amount);
            return;
        }
        if( (this.balance - amount) <= 0 ) {
            System.out.println("Insufficient Balance: " + this.balance);
            return;
        }

        this.balance -= amount;
        receiver.balance += amount;
    }

    public void checkBalance() {
        System.out.println("Current Balance: " + this.balance);
    } 

    long generateAcNumber() {
        return (new Random()).nextLong(10000000000L);
    }
}

// TODO: complete the subclasses below :scream:
class RegularSavings extends Account {
    static float interestRate = 2.7f; 
    
    private void applyInterest() {
        this.balance += this.balance * interestRate;
    }
}

class TermDeposit extends Account {
    static float interestRate = 6.8f; 

    private void applyInterest() {
        this.balance += this.balance * interestRate;
    }
}

class FixedDeposit extends Account {
}

class RecurringDepost extends Account {
} 

public class App {
    public static void main(String[] args) {
        Bank sbc = new Bank("state bank of corruption", 1947, "Kamalesh", "345, North East Towers, Bilay Sector-45, Mumbai");
    }
}