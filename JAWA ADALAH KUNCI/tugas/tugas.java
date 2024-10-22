
public class tugas {
    public static void main(String[] args) {
        int i =100;
        int j =10;
        boolean test = false;
        
        test = (1 > 10) & (j++ > 9 );
        System.out.println(i);
        System.out.println(j);
        System.out.println(test);
        
        test = (1 > 10 ) & (j ++ > 9);
        System.out.println(i);
        System.out.println(j);
        System.out.println(test);
    }
}
