@isTest
private class FileCopierManualTest {

    static fflib_ApexMocks apexMocks;
    static MockFileManager fileManager;
    static FileCopier fileCopier;

    @isTest
    static void someNumbers() {
        initialize(new List<String>{'a', '1', 'b', '2', 'c', '3'});

        Boolean result = fileCopier.copyNumbers('inputPath.txt', 'outputPath.txt');

        Assert.isTrue(result, 'Expected result to be true.');
        Assert.areEqual(new List<String>{'1', '2', '3'}, fileManager.linesWritten, 'Expected {1, 2, 3}');
    }

    static void initialize(List<string> inputLines) {
        fileManager = new MockFileManager();
        fileManager.linesToRead = inputLines;
        fileCopier = new FileCopier(fileManager);
    }

    class MockFileManager extends FileManager{
        public List<String> linesToRead;    // Set this to set the result of a readFile() call.
        public List<String> linesWritten;   // this captures what has been passed to writeFile().

        public override List<String> readFile(String path){
            return linesToRead;
        }
     
        public override void writeFile(String path, List<String> lines){
            linesWritten = lines;
        }
    }
}