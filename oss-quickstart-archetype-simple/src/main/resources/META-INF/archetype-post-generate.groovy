file = new File( request.getOutputDirectory(), request.getArtifactId()+"/.gitignore.tmpl" );
def gitIgnorefile = new File( request.getOutputDirectory(), request.getArtifactId()+"/.gitignore" );
file.renameTo(gitIgnorefile)

moduleName = request.getProperties().get("moduleName");

// module-info.java gets moved into the package of the application; move it back to src/main/java
if (moduleName == null || moduleName.equals("NONE")) {
    moduleInfoFile = new File( request.getOutputDirectory(), request.getArtifactId() + "/src/main/java/" + request.getPackage().replaceAll("\\.", "/") + "/module-info.java" );
    moduleInfoFile.delete();
}
else {
    moduleInfoFile = new File( request.getOutputDirectory(), request.getArtifactId() + "/src/main/java/" + request.getPackage().replaceAll("\\.", "/") + "/module-info.java" );
    def moduleInfoFileNew = new File( request.getOutputDirectory(), request.getArtifactId()+"/src/main/java/module-info.java" );
    moduleInfoFile.renameTo(moduleInfoFileNew)
}
