<%@include file="includes/header.jsp"%>
	<%@include file="includes/navUtils.jsp"%>
                    <div class="expandablebox">
                      <h3 class="featured-title">Please choose the appropriate category for your ad:</h3>
                         
                          <div class="flex-row">
	                          <c:forEach var="category" items="${categories}">
		                          <div class="mjl-column">
		                          	<ul>
		                              	<li style="font-weight:bold;font-size:12px;">${category.categoryName}</li>
		                              	
		                              	<c:forEach var="subcategory" items="${subcategories}">
			                        			<c:choose>
			                        				<c:when test="${subcategory.category.categoryId == category.categoryId}">
				                        				<ul>
				                        				<%-- <c:forEach var="subu" items="${submodels}">
					                        				<c:choose>
					                        					<c:when test="${subcategory.subCategoryId == subu.subCategory.subCategoryId}">
					                        						<li>${subcategory.subCategoryName}</li>		
					                        					</c:when>
					                        					<c:otherwise>
					                        						<li><a href="/new-ads/${subcategory.subCategoryName}"> ${subcategory.subCategoryName}</a></li>	
					                        					</c:otherwise>
					                        				</c:choose>
				                        				</c:forEach>   <!-- End of Sub-MOdel For-Each --> --%>
				                        				
				                        				<li><a href="/new-ads/${subcategory.subCategoryName}"> ${subcategory.subCategoryName}</a></li>	
				                        				
			                        						<c:forEach var="submodel" items="${submodels}">
			                        							<c:choose>
				                        							<c:when test="${subcategory.subCategoryId == submodel.subCategory.subCategoryId}">
				                        								<ul>
				                        									<li><a href="/new-ads/${subcategory.subCategoryName}/${submodel.subModelName}"> ${submodel.subModelName}</a></li>
				                        								</ul>
				                        							</c:when>
			                        							</c:choose>
			                        						</c:forEach>   <!-- End of Sub-MOdel For-Each -->
			                        					</ul>
			                        				</c:when>
			                        			</c:choose>
			                        		</c:forEach> <!-- End of Sub-Category For-Each -->
		                            </ul>
		                          </div>   
	                          </c:forEach> <!-- End of Category For-Each -->
                          </div> <!--  row end -->
                          
                     </div>
     <%@include file="includes/navUtilsFooter.jsp"%>
<%@include file="includes/footer.jsp"%>