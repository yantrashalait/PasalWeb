<%@include file="../../includes/header.jsp"%>
<div class="content-wrapper">
			<c:if test="${param.error!=null}">
				<div class="alert alert-danger alert-dismissible fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<span class="glyphicon glyphicon-remove"></span> Duplicate Housing_Name !!
				</div>
			</c:if>
	<section class="content-header">
		<h1>
			Add New-Housing <small> Pasal Admin Panel</small>
		</h1>
		</br>
		<form:form id="pictureSubmit" action="/admin/edithousing/save" method="POST" commandName="housing" enctype="multipart/form-data">
			<form:input type="hidden" id="housingId"  path="housingId"/>
			<form:input type="hidden" id="picture"  path="picture"/>
			<div class="form-group">
               <label>Housing Name<span style="color:red;"> * </span>:</label><form:errors path="housingName" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="text" class="form-control" id="housingName" path="housingName" required="required"/>
               </div>
             </div>
             
             <div class="form-group">
               <label>No of Bedrooms<span style="color:red;"> * </span>:</label><form:errors path="bedroom" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="number" id="bedroom" path="bedroom" required="required"/>
               </div>
             </div>
             
             <div class="form-group">
               <label>No of Bathrooms<span style="color:red;"> * </span>:</label><form:errors path="bathroom" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="number" id="bathroom" path="bathroom" required="required"/>
               </div>
             </div>
             
             <div class="form-group">
               <label>Area<span style="color:red;"> * </span>:</label><form:errors path="area" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="number"  id="area" path="area" required="required"/>
               </div>
             </div>
            
			<div class="form-group">
              <label>Description <span style="color:red;"> * </span>:</label><form:errors path="description" cssStyle="color:red"/>
              <div class="right">
                <form:textarea id="description" class="form-control" path="description" required="required"></form:textarea>
              </div>
            </div>
            
            <div class="form-group">
              <label>Purpose <span style="color:red;"> * </span>:</label><form:errors path="purpose" cssStyle="color:red"/>
              <div class="right">
                <form:select class="halfwidth" type="text"  id="purpose" path="purpose" required="required">
                  <option value="${housing.purpose}">${housing.purpose}</option>
                  <option value="For Rent">For Rent</option>
                  <option value="For Buy">For Buy</option>
                </form:select>
              </div>
            </div>
            
           <div class="form-group">
             <label>Price<span style="color:red;"> * </span>:</label><form:errors path="price" cssStyle="color:red"/>
             <div class="right">
               <form:input type="number" id="price" path="price" required="required"/>
             </div>
           </div>
             
             <div class="form-group">
               <label>Type <span style="color:red;"> * </span>:</label><form:errors path="type" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="type" path="type" required="required">
                   <option value="${housing.type}">${housing.type}</option>
                   <option value="Civil Home">Civil Home</option>
                   <option value="Apartment">Apartment</option>
                   <option value="Motel">Motel</option>
                 </form:select>
               </div>
             </div>
             
             <div class="form-group">
               <label>Laundry <span style="color:red;"> * </span>:</label></label><form:errors path="laundry" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="laundry" path="laundry" required="required">
                   <option value="${housing.laundry}">${housing.laundry}</option>
                   <option value="In Unit">In Unit</option>
                   <option value="Per Hour">Per Hour</option>
                   <option value="Per kg">Per kg</option>
                 </form:select>
               </div>
             </div>
             
             <div class="form-group">
               <label>Heating <span style="color:red;"> * </span>:</label></label><form:errors path="heating" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="heating" path="heating" required="required">
                   <option value="${housing.heating}">${housing.heating}</option>
                   <option value="No Data">No Data</option>
                 </form:select>
               </div>
             </div>
             
             <div class="form-group">
               <label >Cooling <span style="color:red;"> * </span>:</label></label><form:errors path="cooling" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="cooling" path="cooling" required="required">
                   <option value="${housing.heating}">${housing.cooling}</option>
                   <option value="No Data">No Data</option>
                 </form:select>
               </div>
             </div>  
             
             <div class="form-group">
                <label >Pets <span style="color:red;"> * </span>:</label>
                <div class="right">
                  <div class="checkboxlist" required="required">
                    
                      <form:checkbox id="pets" path="pets" value="Small Dogs"/> Small Dogs
                    </br>
                    <form:checkbox id="pets" path="pets" value="Big Dogs"/> Big Dogs
                    </br>
                    <form:checkbox id="pets" path="pets" value="Cats"/> Cats
                    </br>
                    <form:checkbox id="pets" path="pets" value="Birds"/> Birds
                    </br>
                    
                  </div>
                </div>
              </div>
              
              <div class="form-group">
               <label >Parking <span style="color:red;"> * </span>:</label><form:errors path="parking" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="parking" path="parking" required="required">
                   <option value="${housing.parking}">${housing.parking}</option>
                    <option value="Carport">Carport</option>
                   <option value="No Parking">No Parking</option>
                 </form:select>
               </div>
             </div>
             
             <div class="form-group">
               <label >Available <span style="color:red;"> * </span>:</label><form:errors path="available" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="available" path="available" required="required">
                   <option value="${housing.available}">${housing.available}</option>
                    <option value="Available Now">Available Now</option>
                   <option value="Not Available Now">Not Available Now</option>
                 </form:select>
               </div>
             </div>
             
             <div class="form-group">
               <label >Unit Floor<span style="color:red;"> * </span>:</label><form:errors path="unitFloor" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="number" id="unitFloor" path="unitFloor" required="required"/>
               </div>
             </div>
             
             <div class="form-group">
               <label>Rent/Sqft <span style="color:red;"> * </span>:</label><form:errors path="rentPerSqft" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="number" id="rentPerSqft" path="rentPerSqft" required="required"/>
               </div>
             </div>
             
             <div class="form-group">
               <label >Flooring <span style="color:red;"> * </span>:</label><form:errors path="flooring" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="flooring" path="flooring" required="required">
                   <option value="${housing.flooring}">${housing.flooring}</option>
                    <option value="Tile">Tile</option>
                   <option value="Marble">Marble</option>
                   <option value="Parketting">Parketting</option>
                   <option value="No Flooring">No Flooring</option>
                 </form:select>
               </div>
             </div>
             
             <div class="form-group">
                <label >Appliances<span style="color:red;"> * </span>:</label>
                <div class="right">
                  <div class="checkboxlist" required="required">
                    
                      <form:checkbox id="appliances" path="appliances" value="Washing Machine"/> Washing Machine
                    </br>
                    <form:checkbox id="appliances" path="appliances" value="Dryer"/> Dryer
                    </br>
                    <form:checkbox id="appliances" path="appliances" value="Dish Washer"/> Dish Washer
                    </br>
                    <form:checkbox id="appliances" path="appliances" value="Heater"/> Heater
                    </br>
                    <form:checkbox id="appliances" path="appliances" value="Air-Conditioner"/> Air-Conditioner
                    </br>
                    
                  </div>
                </div>
              </div>
              
              <div class="form-group">
               <label >Dates <span style="color:red;"> * </span>:</label><form:errors path="dates" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="number" id="dates" path="dates" required="required"/>
               </div>
             </div>
             
             <div class="form-group">
              <label >Others <span style="color:red;"> * </span>:</label><form:errors path="others" cssStyle="color:red"/>
              <div class="right">
                <form:textarea id="others" path="others" required="required"></form:textarea>
              </div>
            </div>
            
            <div class="form-group">
               <label >Brands <span style="color:red;"> * </span>:</label><form:errors path="brand" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="brand" path="brand" required="required">
                 	<option value="${housing.brand.brandId}">${housing.brand.brandName}</option>
                   <c:forEach var="brand" items="${brands}">
                   	<option value="${brand.brandId}">${brand.brandName}</option>
                   </c:forEach> 
                 </form:select>
               </div>
             </div>
             
             <label>Upload Image For Gallery</label>
	  		<div class="form-inline form-group">
	  			<div class="form-group">
		  			<p>The EDIT will replace the picture that you upload next serially !!</p>
			    		<p>
		                <input id="fileInput" type="file" name="uploadingFiles" onchange="updateSize();" multiple>
		                selected files: <span id="fileNum">0</span>;
		                total size: <span id="fileSize">0</span>
	            		</p>
		  		</div>
		  	</div>
		  	
		  	<c:if test="${not empty searchedHousingPictures}">
  				<div class="expandablebox" style="margin:10px 0">
	  			<h3 class="featured-title">Uploaded Images:</h3>
	  			<c:forEach var="housingPicture" items="${searchedHousingPictures}">
	  				
	  				<div class="up-img-wrapper" style="position:relative">
	  					<img src="/pasal/images/housing/${housingPicture.housing.brand.brandName}/${housingPicture.pictureName}" style=" height:150px; width:200px; "/>
		  				<a href="/admin/deletehousingpicture/${housing.housingId}/${housingPicture.id}" class="bg-danger"><span class="badge" style="background-color: red;border-radius: 50%;color: #ffff;right: 0;top: -14px;font-size: 14px;position: absolute;padding: 7px 10px;">x</span></a>
	  				</div>

	  			</c:forEach>
	  			</div>
	  		</c:if>

		  	<button type="submit" class="btn btn-primary">Add</button> <a href="/admin/housing" class="btn btn-default">Cancel</a>		  	
		</form:form>
	</section>
	<script>
            function updateSize() {
                var nBytes = 0,
                        oFiles = document.getElementById("fileInput").files,
                        nFiles = oFiles.length;
                for (var nFileId = 0; nFileId < nFiles; nFileId++) {
                    nBytes += oFiles[nFileId].size;
                }

                var sOutput = nBytes + " bytes";
                // optional code for multiples approximation
                for (var aMultiples = ["KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"], nMultiple = 0, nApprox = nBytes / 1024; nApprox > 1; nApprox /= 1024, nMultiple++) {
                    sOutput = nApprox.toFixed(3) + " " + aMultiples[nMultiple] + " (" + nBytes + " bytes)";
                }
                // end of optional code

                document.getElementById("fileNum").innerHTML = nFiles;
                document.getElementById("fileSize").innerHTML = sOutput;
            }
        </script>
        
        <script>
      	// Form auto submit
	      	$('#fileInput').on("change", function(){
		  		var fullPath = document.getElementById('fileInput').value;
		  		// If new file is uploaded
				if (fullPath) {
					$('#pictureSubmit').submit();
				}
		  	});
	      </script>
</div>
<%@include file="../../includes/footer.jsp"%>