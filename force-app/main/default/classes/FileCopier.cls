public with sharing class FileCopier {

    private FileManager _fileManager;

    public FileCopier(FileManager fileManager) {
        fileManager = fileManager;
    }

    public Boolean copyNumbers(String inputPath, String outputPath){
        List<String> inputLines = _fileManager.readFile(inputPath);
        
        List<String> outputLines = new List<String>();
        for(String line: inputLines){
            if (line.isNumeric()){
                outputLines.add(line);
            }
        }

        if (!outputLines.isEmpty()){
            _fileManager.writeFile(outputPath, outputLines);
            return true;
        }

        return false;
    }
}