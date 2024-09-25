package util;

public class PageScrollHandler {
    private int totalCnt, currentPage, pageSize, lastPost;
    private boolean showNext;

    public PageScrollHandler(int totalCnt, int currentPage) {
        this(totalCnt, currentPage, 5);
    }

    public PageScrollHandler(int totalCnt, int currentPage, int pageSize) {
        this.totalCnt = totalCnt;
        this.pageSize = pageSize;
        this.currentPage = currentPage;

        lastPost = currentPage * pageSize;
        showNext = lastPost < totalCnt;
        System.out.println("totalCnt: " + totalCnt + " currentPage: " + currentPage + " pageSize: " + pageSize + " lastPost: " + lastPost + " showNext: " + showNext);
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    public int getLastPost() {
        return lastPost;
    }

    public void setLastPost(int lastPost) {
        this.lastPost = lastPost;
    }

    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
}
