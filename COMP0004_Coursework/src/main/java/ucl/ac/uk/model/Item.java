package ucl.ac.uk.model;

public class Item {
    private String text;
    private String url;
    private String image;

    public Item(String text, String url, String image) {
        this.text = text;
        this.url = url;
        this.image = image;
    }

    public String getText() {
        return text;
    }

    public void replaceText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public String getImage() {
        return image;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(text);
        if (url != null && !url.trim().isEmpty()) {
            sb.append(" (").append(url).append(")");
        }
        if (image != null && !image.trim().isEmpty()) {
            sb.append(" <img src=\"").append(image).append("\">");
        }
        return sb.toString();
    }

}