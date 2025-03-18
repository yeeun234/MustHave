package utils;

public class BoardPage {
	public static String pagingStr ( int totalCount,int pageSize, int blockPage, int pageNum,String reqUrl) {
		String pagigngStr = "";
		
		int totalPages = (int)(Math.ceil(((double) totalCount/pageSize)));
		
		int pageTemp = (((pageNum -1) / blockPage) * blockPage)+1;
		
		if(pageTemp !=1) {
			pagigngStr += "<a href='"+reqUrl +"?pageNum=1'>[첫페이지]</a>"; 
			pagigngStr += "&nbsp";
			pagigngStr += "<a href='"+reqUrl +"?pageNum="+(pageTemp-1)+"'>[이전 블록]</a>"; 
		}
		
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp ==pageNum ) {
				pagigngStr += "&nbsp;" + pageTemp + "&nbsp;";
			}else {
				pagigngStr += "&nbsp; <a href ='" +reqUrl+"?pageNum="+pageTemp +"'>"+pageTemp +"</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		
		if(pageTemp <= totalPages) {
			pagigngStr += "<a href='"+reqUrl +"?pageNum="+ pageTemp +"'>[다음 블록]</a>"; 
			pagigngStr += "&nbsp";
			pagigngStr += "<a href='"+reqUrl +"?pageNum="+totalPages+"'>[마지막 페이지]</a>"; 
	
		}
		return pagigngStr;
				
	}
}
