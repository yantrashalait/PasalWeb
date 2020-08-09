<%@include file="../../includes/header.jsp"%>
<div class="content-wrapper">
			<c:if test="${param.error!=null}">
				<div class="alert alert-danger alert-dismissible fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<span class="glyphicon glyphicon-remove"></span> Duplicate Car_Name !!
				</div>
			</c:if>
	<section class="content-header">
		<h1>
			Add New-Car <small> Pasal Admin Panel</small>
		</h1>
		</br>
		<form:form action="/admin/addcar/save" method="POST" commandName="car" enctype="multipart/form-data">
			<div class="form-group">
               <label>Car Name<span style="color:red;"> * </span>:</label><form:errors path="carName" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="text" class="form-control" id="carName" path="carName" required="required"/>
               </div>
             </div>
             
             <div class="form-group">
	             <label>Price<span style="color:red;"> * </span>:</label><form:errors path="price" cssStyle="color:red"/>
	             <div class="right">
	               <form:input type="number" id="price" path="price" required="required"/>
	             </div>
	           </div>
	           
	           <div class="form-group">
	              <label>Description <span style="color:red;"> * </span>:</label><form:errors path="description" cssStyle="color:red"/>
	              <div class="right">
	                <form:textarea id="description" class="form-control" path="description" required="required"></form:textarea>
	              </div>
	            </div>
	            
	            <div class="form-group">
	               <label>Type <span style="color:red;"> * </span>:</label><form:errors path="type" cssStyle="color:red"/>
	               <div class="right">
	                 <form:select class="halfwidth" type="text" id="type" path="type" required="required">
	                   <option></option>
                          <option value="Jeep / SUV">Jeep / SUV</option>
                           <option value="Sedan">Sedan</option>
                           <option value="MUV / CUV">MUV / CUV</option>
                           <option value="Van">Van</option>
                           <option value="Bus">Bus</option>
                           <option value="Truck">Truck</option>
                           <option value="Pickup">Pickup</option>
                           <option value="Small Hatchback">Small Hatchback</option>
                           <option value="Mid Size Hatchback">Mid Size Hatchback</option>
                           <option value="Others">Others</option>
	                 </form:select>
	               </div>
	             </div>
             
             <div class="form-group">
               <label>Color<span style="color:red;"> * </span>:</label><form:errors path="color" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="text" id="color" path="color" required="required"/>
               </div>
             </div>
             
             <div class="form-group">
               <label>Engine<span style="color:red;"> * </span>:</label><form:errors path="engine" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="number" id="engine" path="engine" required="required"/>
               </div>
             </div>
             
			
             
             <div class="form-group">
               <label>Fuel <span style="color:red;"> * </span>:</label><form:errors path="fuel" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="fuel" path="fuel" required="required">
                   <option></option>
                   <option value="Petrol">Petrol</option>
                   <option value="Deisel">Deisel</option>
                   <option value="Electric">Electric</option>
                 </form:select>
               </div>
             </div>
             
             <div class="form-group">
               <label>Transmission <span style="color:red;"> * </span>:</label></label><form:errors path="transmission" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="transmission" path="transmission" required="required">
                   <option></option>
                   <option value="Manual 2D">Manual 2D</option>
                   <option value="Manual 3D">Manual 3D</option>
                   <option value="Manual 3D">Manual 3D</option>
                   <option value="Automatic">Automatic</option>
                 </form:select>
               </div>
             </div>
             
             <div class="form-group">
               <label >Make Year<span style="color:red;"> * </span>:</label><form:errors path="makeYear" cssStyle="color:red"/>
               <div class="right">
                 <form:input type="number" id="makeYear" path="makeYear" required="required"/>
               </div>
             </div>
             
             <div class="form-group">
                <label >Features <span style="color:red;"> * </span>:</label>
                <div class="right">
                  <div class="checkboxlist" required="required">
                    
                    <form:checkbox id="features" path="features" value="Power Window"/> Power Window
                    	</br>
                      <form:checkbox id="features" path="features" value="Power Steering"/> Power Steering
                   	</br>
                      <form:checkbox id="features" path="features" value="Leather Seat"/> Leather Seat
                    	</br>
                      <form:checkbox id="features" path="features" value="Sunroof"/> Sunroof
                    </br>
                      <form:checkbox id="features" path="features" value="Central Lock"/> Central Lock
                    </br>
                      <form:checkbox id="features" path="features" value="Alloy Wheels"/> Alloy Wheels
                    </br>
                      <form:checkbox id="features" path="features" value="Anti-theft Alarm"/> Anti-theft Alarm
                    </br>
                      <form:checkbox id="features" path="features" value="Keyless Remote Entry"/> Keyless Remote Entry
                    </br>
                      <form:checkbox id="features" path="features" value="Tubeless Tyres"/> Tubeless Tyres
                    </br>
                      <form:checkbox id="features" path="features" value="Air Bags"/> Air Bags
                    </br>
                      <form:checkbox id="features" path="features" value="Anti-lock Braking (ABS)"/> Anti-lock Braking (ABS) 
                    </br>
                      <form:checkbox id="features" path="features" value="Air Conditioning"/> Air Conditioning 
                    </br>
                      <form:checkbox id="features" path="features" value="Climate Control"/> Climate Control 
                    </br>
                      <form:checkbox id="features" path="features" value="Steering Mounted Controls"/> Steering Mounted Controls 
                    </br>
                      <form:checkbox id="features" path="features" value="Projected Headlight"/> Projected Headlight 
                    </br>
                      <form:checkbox id="features" path="features" value="Fog Lights"/> Fog Lights 
                    </br>
                      <form:checkbox id="features" path="features" value="Electric ORVM"/> Electric ORVM 
                    </br>
                      <form:checkbox id="features" path="features" value="Audio System"/> Audio System 
                    </br>
                      <form:checkbox id="features" path="features" value="LCD Touchscreen"/> LCD Touchscreen 
                    </br>
                      <form:checkbox id="features" path="features" value="Bluetooth Connectivity"/> Bluetooth Connectivity 
                    </br>
                    
                  </div>
                </div>
              </div>
             
            <div class="form-group">
               <label >Brands <span style="color:red;"> * </span>:</label><form:errors path="brand" cssStyle="color:red"/>
               <div class="right">
                 <form:select class="halfwidth" type="text" id="brand" path="brand" required="required">
                   <c:forEach var="brand" items="${brands}">
                   	<option value="${brand.brandId}">${brand.brandName}</option>
                   </c:forEach> 
                 </form:select>
               </div>
             </div>
             
            <label>Upload Image For Gallery</label>
	  		<div class="form-inline form-group">
	  			<div class="form-group">
		    		<p>
	                <input id="fileInput" type="file" name="uploadingFiles" onchange="updateSize();" multiple>
	                selected files: <span id="fileNum">0</span>;
	                total size: <span id="fileSize">0</span>
            		</p>
            		<p>
                		<input type="submit" value="Upload files">
            		</p>
		  		</div>
		  	</div>
		  	
		  	
		  	
		  	<button type="submit" class="btn btn-primary">Add</button> <a href="/admin/car" class="btn btn-default">Cancel</a>		  	
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
</div>
<%@include file="../../includes/footer.jsp"%>