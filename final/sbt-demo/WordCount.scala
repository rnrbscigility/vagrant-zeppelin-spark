import org.apache.spark.{SparkConf, SparkContext}
import org.apache.hadoop.fs.{FileSystem, Path}
import com.typesafe.config.ConfigFactory

object WordCount {

  val devMode = "dev"  // "dev" or "prod"
  
  def main(args: Array[String]) {
    
    val appConfiguration = ConfigFactory.load()
	
    val deployMode = appConfiguration.getConfig(devMode).getString("deployMode") 
    val conf = new SparkConf().setAppName("Spark WordCount").setMaster(deployMode)

    val inputPath = appConfiguration.getConfig(devMode).getString("inputPath") 
    val outputPath = appConfiguration.getConfig(devMode).getString("outputPath") 
      
    val sc = new SparkContext(conf)
    
    // Ensure output path has not been created
    val hadoopFS = FileSystem.get(sc.hadoopConfiguration)
    
    if(hadoopFS.exists(new Path(outputPath)))
      hadoopFS.delete(new Path(outputPath), true)
            
    // Load from filesystem
    val sparkWC_File = sc.textFile(inputPath)

    val sparkWC_Words = sparkWC_File.flatMap(line => line.split(" "))
    val sparkWC_MappedWords = sparkWC_Words.map(word => (word, 1))
    val sparkWC_WordCounts = sparkWC_MappedWords.reduceByKey((counter, count) => counter + count)
    
    // Save to filesystem
    sparkWC_WordCounts.saveAsTextFile(outputPath)
	}
}