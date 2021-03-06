package util;
public class PageVO {
	//화면에 그려질 pageNation을 계산하는 클래스(생성할 때 pageNum와 전체 게시글 수를 가지고 계산)
	private int startPage=1; // 게시글 화면에 보여질 첫 페이지 번호
	private int endPage=1; // 게시글 화면에 보여질 마지막 페이지 번호
	private boolean prev=true,next=true; // 다음, 이전 버튼 활성화 여부
	private int pageNum=1; // 현재 조회하는 페이지 번호
	private int total=1; // 전체 게시글 수
	private int amount=10; // 한 페이지에서 몇개의 데이터를 보여줄건가
	private int viewPageNum=10; // 보여질 페이지 수
	//생성될 때 계산 처리
	public PageVO() {super();}
	public PageVO(int pageNum,int total) {
		super();
		this.pageNum=pageNum;
		this.total=total;
		this.endPage=(int)Math.ceil(this.pageNum/(double)this.viewPageNum)*this.viewPageNum;
		this.startPage=this.endPage-this.viewPageNum+1;
		int realEnd=(int)Math.ceil(this.total/(double)this.amount);
		if(this.endPage>realEnd) {
			this.endPage=realEnd;
		}
		this.prev=this.startPage>1;
		this.next=realEnd>this.endPage;
		System.out.println("시작 페이지 : "+startPage+", 끝 페이지 : "+endPage);
	}
	public PageVO(int pageNum,int total,int amount) {
		super();
		this.pageNum=pageNum;
		this.total=total;
		this.amount=amount;
		//1. endPage 계산
		//현재 페이지가 1~10번이라면 -> 화면에 보여질 끝 페이지 10
		//현재 페이지가 14번이라면 -> 화면에 보여질 끝 페이지는 20
		//공식 : (int)Math.ceil(페이지 번호 / (doubl)보여질 페이지 수) * 보여질 페이지 수
		this.endPage=(int)Math.ceil(this.pageNum/(double)this.viewPageNum)*this.viewPageNum;
		//2. startPage 계산
		//공식 : 끝 페이지 - 보여질 페이지 수 + 1
		this.startPage=this.endPage-this.viewPageNum+1;
		//3. 실제 보여질 끝 페이지 계산
		//만약 총 게시물이 52개라면 -> 페이지 번호는 6까지 표시되야 함
		//만약 총 게시물이 105개라면 -> 페이지 번호는 11까지 표시되야 함
		//공식 : 실제 끝 번호 = (int)Math.ceil(전체 게시글 수 / 페이지에 보여지는 데이터 수)
		int realEnd=(int)Math.ceil(this.total/(double)this.amount);
		//ex : 131개의 게시물
		//1번 페이지 클릭시 -> endPage는 10, realEnd는 14 (endPage로 세팅)
		//11번 페이지 클릭시 -> endPage는 20, realEnd는 14 (realEnd로 세팅)
		//결론 : endPage > realEnd 라면 realEnd를 보여주면 됨
		if(this.endPage>realEnd) {
			this.endPage=realEnd;
		}
		//4. 이전 버튼
		//startPage는 1,11,21....101형태로 표기됨
		//startPage가 1보단 큰 경우는 true
		this.prev=this.startPage>1;
		//5. 다음 버튼
		this.next=realEnd>this.endPage;
		System.out.println("시작 페이지 : "+startPage+", 끝 페이지 : "+endPage);
	}
	public PageVO(int pageNum,int total,int amount,int viewPageNum) {
		super();
		this.pageNum=pageNum;
		this.total=total;
		this.amount=amount;
		this.viewPageNum=viewPageNum;
		this.endPage=(int)Math.ceil(this.pageNum/(double)this.viewPageNum)*this.viewPageNum;
		this.startPage=this.endPage-this.viewPageNum+1;
		int realEnd=(int)Math.ceil(this.total/(double)this.amount);
		if(this.endPage>realEnd) {
			this.endPage=realEnd;
		}
		this.prev=this.startPage>1;
		this.next=realEnd>this.endPage;
		System.out.println("시작 페이지 : "+startPage+", 끝 페이지 : "+endPage);
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getViewPageNum() {
		return viewPageNum;
	}
	public void setViewPageNum(int viewPageNum) {
		this.viewPageNum = viewPageNum;
	}
}