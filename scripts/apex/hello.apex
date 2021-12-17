// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

public class TestWrapper {
    public string name;
    public integer index;
    public List<TestWrapper> children;

    public TestWrapper(string name, integer index){
        this.name = name;
        this.index = index;
        this.children = new List<TestWrapper>();
    }

    public void outputRecord(integer depth){
        system.debug('Depth: ' + depth + ' - Record: ' + this.name + ' - ' + this.index);
        if (this.children != null && this.children.size() > 0){
            for (TestWrapper child : this.children){
                child.outputRecord(depth + 1);
            }
        }
    }

}

TestWrapper tw = new TestWrapper('test1', 0);
tw.children.add(new TestWrapper('test2', 0));
tw.children[0].children.addAll(new List<TestWrapper>{ new TestWrapper('test3', 0), new TestWrapper('test4', 1) });
tw.children.add(new TestWrapper('test5', 1));

tw.outputRecord(0);