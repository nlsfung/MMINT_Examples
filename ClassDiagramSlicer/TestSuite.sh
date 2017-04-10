MODELS_XML="<models uri=\"/ClassDiagramSlicer/#1.classdiagram\" name=\"#1\" metatypeUri=\"http://se.cs.toronto.edu/modelepedia/ClassDiagram\" dynamic=\"true\" fileExtension=\"classdiagram\" editors=\"//@editors.#2\"/>"
EDITOR_XML="<editors xsi:type=\"editor:Diagram\" uri=\"/ClassDiagramSlicer/#1.classdiagramdiag\" name=\"ClassDiagram diagram for model /ClassDiagramSlicer/#1.classdiagram\" metatypeUri=\"http://se.cs.toronto.edu/modelepedia/Diagram_ClassDiagram\" dynamic=\"true\" modelUri=\"/ClassDiagramSlicer/#1.classdiagram\" id=\"edu.toronto.cs.se.modelepedia.classdiagram.diagram.part.ClassDiagramDiagramEditorID\" wizardId=\"edu.toronto.cs.se.modelepedia.classdiagram.diagram.part.ClassDiagramCreationWizardID\">\n<fileExtensions>classdiagramdiag</fileExtensions>\n</editors>"
TABLE_XML="<extendibleTable key=\"/ClassDiagramSlicer/#1.classdiagram\" value=\"//@models.#2\"/>"

CRIT_REL_XML="<models xsi:type=\"relationship:ModelRel\" uri=\"\" name=\"crit#1\" metatypeUri=\"http://se.cs.toronto.edu/mmint/ModelRel\" dynamic=\"true\" origin=\"CREATED\" fileExtension=\"\">\n<modelEndpoints uri=\"\" name=\"#1\" metatypeUri=\"http://se.cs.toronto.edu/mmint/ModelRel-Model/ModelEndpoint\" dynamic=\"true\" lowerBound=\"1\" upperBound=\"1\" target=\"//@models.#2\"/>\n<modelEndpointRefs referencedObject=\"//@models.#3/@modelEndpoints.0\" modifiable=\"true\">\n</modelEndpointRefs>\n</models>"
SOL_REL_XML="<models xsi:type=\"relationship:ModelRel\" uri=\"\" name=\"sol#1\" metatypeUri=\"http://se.cs.toronto.edu/mmint/ModelRel\" dynamic=\"true\" origin=\"CREATED\" fileExtension=\"\">\n<modelEndpoints uri=\"\" name=\"#1\" metatypeUri=\"http://se.cs.toronto.edu/mmint/ModelRel-Model/ModelEndpoint\" dynamic=\"true\" lowerBound=\"1\" upperBound=\"1\" target=\"//@models.#2\"/>\n<modelEndpointRefs referencedObject=\"//@models.#3/@modelEndpoints.0\" modifiable=\"true\">\n</modelEndpointRefs>\n</models>"

TOTAL_COUNT="26"

DIAGRAM_NAME=""
DIAGRAM_ID=""
CRIT_REL_ID=""
SOL_REL_ID=""

echo > Models.temp
echo > Editor.temp
echo > Table.temp
echo > CritRel.temp
echo > SolRel.temp

for ((i=1; i<=${TOTAL_COUNT}; i++)); do
    DIAGRAM_NAME="${i}"
    DIAGRAM_ID="$((${i}-1))"
    CRIT_REL_ID="$((${DIAGRAM_ID}+${TOTAL_COUNT}))"
    SOL_REL_ID="$((${CRIT_REL_ID}+${TOTAL_COUNT}))"

    if ((${#DIAGRAM_NAME} < 2)); then 
      DIAGRAM_NAME="0${DIAGRAM_NAME}"
    fi

    echo -e ${MODELS_XML} | 
      sed -e "s/#1/${DIAGRAM_NAME}/g" | 
      sed -e "s/#2/${DIAGRAM_ID}/g" >> Models.temp

    echo -e ${EDITOR_XML} | 
      sed -e "s/#1/${DIAGRAM_NAME}/g" | 
      sed -e "s/#2/${DIAGRAM_ID}/g" >> Editor.temp 

    echo -e ${TABLE_XML} | 
      sed -e "s/#1/${DIAGRAM_NAME}/g" | 
      sed -e "s/#2/${DIAGRAM_ID}/g" >> Table.temp

    echo -e ${CRIT_REL_XML} |
      sed -e "s/#1/${DIAGRAM_NAME}/g" |
      sed -e "s/#2/${DIAGRAM_ID}/g" |
      sed -e "s/#3/${CRIT_REL_ID}/g" >> CritRel.temp

    echo -e ${SOL_REL_XML} |
      sed -e "s/#1/${DIAGRAM_NAME}/g" |
      sed -e "s/#2/${DIAGRAM_ID}/g" |
      sed -e "s/#3/${SOL_REL_ID}/g" >> SolRel.temp
done

cat Models.temp CritRel.temp SolRel.temp Editor.temp Table.temp > TestSuiteBody.xml
rm -v *.temp
